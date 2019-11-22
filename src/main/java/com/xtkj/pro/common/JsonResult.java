package com.xtkj.pro.common;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class JsonResult {

    private String code;
    private String message;
    private Object result;
    private int limit;
    private int offSet;

    public JsonResult() {
        super();
    }

    public JsonResult(String code, String message) {
        super();
        this.code = code;
        this.message = message;
    }

    public JsonResult(String code, String message, Object result, int limit, int offSet) {
        super();
        this.code = code;
        this.message = message;
        this.result = result;
        this.limit = limit;
        this.offSet = offSet;
    }

    public JsonResult(String code, String message, Object result) {
        super();
        this.code = code;
        this.message = message;
        this.result = result;
    }
}
