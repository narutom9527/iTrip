package org.itrip.controller;

import redis.clients.jedis.Jedis;

public class RedisTest {
	public static void main(String[] args) {
		Jedis jedis = new Jedis("47.107.224.103",6379);
		jedis.auth("naruto");
		jedis.connect();
		
		String name = jedis.set("4396","777");
		System.out.println("name="+name);
		jedis.close();
	}
}
