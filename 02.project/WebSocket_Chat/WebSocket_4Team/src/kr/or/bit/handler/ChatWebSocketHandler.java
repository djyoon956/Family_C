package kr.or.bit.handler;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.bit.dto.ChatRoom;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	// 접속한 전체 유저 관리
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	// 채팅방 관리
	private Map<String, ChatRoom> roomInfos = new HashMap<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + " 연결 됨");
		String cmd =getAttribute(session, "cmd");
		String user =getAttribute(session, "user");
		// 채팅 접속
		if(cmd.equals("on")) {
			users.put(user, session);			
			sendChatRoomInfoMessage();
		}
		// 채팅방 접속
		else if(cmd.equals("join")) {
			joinChatRoom(session, user, getAttribute(session, "room"));
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
		JSONObject data = new JSONObject(message.getPayload());
		String cmd = data.getString("cmd");

		if (cmd.equals("message")) {
			sendMessage(session, data);
		} else if (cmd.equals("createChatRoom"))
			createChatRoom(session, data);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String cmd = getAttribute(session, "cmd");
		String user = getAttribute(session, "user");
		System.out.println(cmd+user);
		// 접속 유저 종료
		if(cmd.equals("on")) { 
			System.out.println("창 종료");
			users.remove(user);
		}
		// 채팅창 종료
		else  if(cmd.equals("join")){ 
			System.out.println("채팅 종료");
			String roomName = getAttribute(session, "room");

			ChatRoom room = roomInfos.get(roomName);
			room.removeUser(user);
			sendMemberInfoMessage(room, user + "님이 나가셨습니다.");
			sendChatRoomInfoMessage();
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

	private void sendMessage(WebSocketSession session, JSONObject data) throws Exception {
		String sendUser = getAttribute(session, "user");
		JSONObject json = new JSONObject().put("message", data.getString("message"))
																.put("sender", sendUser);

		ChatRoom room = roomInfos.get(data.get("room"));
		for (Map.Entry<String, WebSocketSession> userInfo : room.getUsers().entrySet()) {
			String type = sendUser.equals(userInfo.getKey()) ? "my" : "other";
			json.put("type", type);

			userInfo.getValue().sendMessage(new TextMessage(json.toString()));
		}
	}

	private void createChatRoom(WebSocketSession session, JSONObject data) throws Exception {
		ChatRoom room = new ChatRoom(getAttribute(session, "user")
														, data.getString("name")
														, Integer.parseInt(data.getString("max")));

		roomInfos.put(room.getName(), room);
		sendChatRoomInfoMessage();
	}

	private void joinChatRoom(WebSocketSession session, String user, String room) throws Exception {
		ChatRoom chatRoom = roomInfos.get(room);
		chatRoom.addUser(user, session);
		sendMemberInfoMessage(chatRoom, user + "님이 들어오셨습니다.");

		sendChatRoomInfoMessage();
	}

	private void sendMemberInfoMessage(ChatRoom room, String message) throws Exception {
		String jsonString = new JSONObject().put("message", message)
																.put("type", "memberInfo")
																.put("owner", room.getOwner())
																.put("users", new JSONArray(room.getUserName())).toString();

		for (WebSocketSession s : room.getUsers().values())
			s.sendMessage(new TextMessage(jsonString));
	}

	private void sendChatRoomInfoMessage() throws Exception {
		JSONArray array = new JSONArray();
		for(ChatRoom room : roomInfos.values()) {
			array.put(new JSONObject().put("owner", room.getOwner())
													.put("max", room.getMax())
													.put("name", room.getName())
													.put("users", new JSONArray(room.getUserName())));
		}
		
		String jsonString = new JSONObject().put("type", "chatRoomInfo")
																.put("rooms", array).toString();
		
		for (WebSocketSession s : users.values())
			s.sendMessage(new TextMessage(jsonString));
	}
	
	public String getAttribute(WebSocketSession session, String parameter) {
		return (String) session.getAttributes().get(parameter);
	}
}
