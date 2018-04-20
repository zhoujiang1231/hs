package com.hs.entity;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.Serializable;

/**
 * 基础实体类
 * 
 * @author Jiangsl
 * @date 2018/03/13
 *
 */
public abstract class BaseEntity implements Serializable {
	protected static ObjectMapper mapper = new ObjectMapper();

	@Override
	public String toString() {
		try {
			return mapper.writeValueAsString(this);
		} catch (JsonProcessingException e) {
		}
		return null;
	}

}
