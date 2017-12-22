package com.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.MessageHandler;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.web.context.ContextLoader;

import com.module.user.service.UserService;

//该注解用来指定一个URI，客户端可以通过这个URI来连接到WebSocket。类似Servlet的注解mapping。无需在web.xml中配置。
@ServerEndpoint("/msgWebsocket/{userId}")
public class MessageWebSocket implements MessageHandler {
	
	//控制webSocket手动配置spring注入权限service类
	UserService userService = (UserService) ContextLoader .getCurrentWebApplicationContext().getBean("userService");
	
	// 静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
	private static int onlineCount = 0;
	private Map<String, String> msgObj = new HashMap<String, String>();

	// concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
	private static CopyOnWriteArraySet<MessageWebSocket> webSocketSet = new CopyOnWriteArraySet<MessageWebSocket>();

	// 与某个客户端的连接会话，需要通过它来给客户端发送数据
	private Session session;

	/**
	 * 连接建立成功调用的方法
	 * 
	 * @param session
	 *            可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
	 * @throws UnsupportedEncodingException
	 */
	
	@OnOpen
	public void onOpen(@PathParam("userId") String userId, Session session) {
		this.session = session;
		this.msgObj.put("userId", userId);
		this.msgObj.put("IS_ONLINE", "0");
		this.msgObj.put("ID", userId);
		userService.updateByOnLine(this.msgObj);
		webSocketSet.add(this); // 加入set中
		addOnlineCount(); // 在线数加1
	}

	/**
	 * 连接关闭调用的方法
	 */
	@OnClose
	public void onClose() {
		System.out.println(this.msgObj+"");
		this.msgObj.put("IS_ONLINE", "1");
		userService.updateByOnLine(this.msgObj);
		webSocketSet.remove(this); // 从set中删除
		subOnlineCount(); // 在线数减1
	}

	/**
	 * 收到客户端消息后调用的方法
	 * 
	 * @param message
	 *            客户端发送过来的消息
	 * @param session
	 *            可选的参数
	 */
	@OnMessage
	public void onMessage(String message, Session session) {
		sendByUser(message, session);
	}

	public void sendByUser(String message, Session session) {
		// 群发消息
		Map<String,String> mapOne=JsonUtils.jsonToMap(message);
		
		//JSONArray array=JSONArray.fromObject(mapOne.get("USER_ID_ARR"));
		String userIdArr = mapOne.get("USER_ID_ARR");//'asdasd','asdasdasd,asdasdasd,asdasdasd,asd'
		String type =  mapOne.get("TYPE");;
		if(type == null && !("").equals(type)){
			//Object[] strArr=array.toArray();
			if (webSocketSet != null && webSocketSet.size() > 0) {
				for (MessageWebSocket item : webSocketSet) {
					this.session = session;
				//	for(int i=0;i<strArr.length;i++){                                           //strArr[i]
						if(item.msgObj.get("userId") != null && item.msgObj.get("userId").equals(userIdArr)){
							try {
								item.sendMessage(message);
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}	
					//}
				}
			}
		}else{
			Object[] strArr=userIdArr.split(",");
			if (webSocketSet != null && webSocketSet.size() > 0) {
				for (MessageWebSocket item : webSocketSet) {
					this.session = session;
					for(int i=0;i<strArr.length;i++){                                           //
						if(item.msgObj.get("userId") != null && item.msgObj.get("userId").equals(strArr[i])){
							try {
								mapOne.put("USER_ID_ARR",strArr[i]+"");
								item.sendMessage(JsonUtils.mapToJson(mapOne));
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}	
					}
				}
			}
		}
	}

	/**
	 * 发生错误时调用
	 * 
	 * @param session
	 * @param error
	 */
	@OnError
	public void onError(Session session, Throwable error) {
		System.out.println("发生错误");
		error.printStackTrace();
	}

	/**
	 * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
	 * 
	 * @param message
	 * @throws IOException
	 */
	public void sendMessage(String message) throws IOException {

		this.session.getBasicRemote().sendText(message);
	}

	public static synchronized int getOnlineCount() {
		return onlineCount;
	}

	public static synchronized void addOnlineCount() {
		MessageWebSocket.onlineCount++;
	}

	public static synchronized void subOnlineCount() {
		MessageWebSocket.onlineCount--;
	}
}