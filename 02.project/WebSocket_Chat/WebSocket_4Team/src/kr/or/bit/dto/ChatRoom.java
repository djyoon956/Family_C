package kr.or.bit.dto;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.WebSocketSession;

public class ChatRoom {
	private String owner;
	private String name;
	private int max;
	private Map<String, WebSocketSession> users;

	public ChatRoom(String owner, String name, int max) {
		this.owner = owner;
		this.name = name;
		this.max = max;
		this.users = new HashMap<>();
	}


	public String getOwner() {
		return owner;
	}


	public void setOwner(String owner) {
		this.owner = owner;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getMax() {
		return max;
	}


	public void setMax(int max) {
		this.max = max;
	}


	public Map<String, WebSocketSession> getUsers() {
		return users;
	}
	
	public List<String> getUserName() {
		return new ArrayList<String>(users.keySet());
	}


	public void setUsers(Map<String, WebSocketSession> users) {
		this.users = users;
	}


	public void addUser(String user, WebSocketSession session) {
		users.put(user, session);
	}
	
	public void removeUser(String user) {
		users.remove(user);
	}
}
