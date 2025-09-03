package com.javaweb.enums;

import java.util.TreeMap;

public enum District {
    QUAN_1("Quận 1"),
    QUAN_2("Quận 2"),
    QUAN_8("Quận 8"),
    QUAN_3("Quận 3"),
    QUAN_5("Quận 5"),
    QUAN_10("Quận 10"),
    QUAN_9("Quận 9"),
    QUAN_11("Quận 11"),
    QUAN_BINH_THANH("Quận Bình Thạnh");

    private final String districtName;


    District(String districtName) {
        this.districtName = districtName; // khoi tao gia tri value
    }

    public String getDistrictName() {
        return districtName;
    }

    public static TreeMap<String, String> type(){
        TreeMap<String, String> districts = new TreeMap<>();
        for(District item : District.values()){ // duyet enum
            districts.put(item.toString(), item.districtName);
        }
        return districts;
    }

    public static String getDistrictNameByCode(String code){
        try{
            District district = District.valueOf(code);
            return district.getDistrictName();
        }
        catch(Exception e){
            return "";
        }
    }
}
