package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum TypeCode {
    TANG_TRET("Tầng trệt"),
    NGUYEN_CAN("Nguyên căn"),
    NOI_THAT("Nội thất");

    private final String name;

    TypeCode(String name) {
        this.name = name;
    }

    public static Map<String,String> type(){
        Map<String,String> typeCodes = new HashMap<>();
        for(TypeCode typeCode : TypeCode.values()){
            typeCodes.put(typeCode.toString(),typeCode.name);
        }
        return typeCodes;
    }
}
