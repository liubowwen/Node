package vip.wylbw.dto;

import lombok.Data;


public class ResultDTO<T> {
    private T data;
    private String message;

    public  ResultDTO(T data, String message) {
        this.data = data;
        this.message = message;
    }
}
