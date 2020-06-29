package vip.wylbw.Model;

import lombok.Data;

@Data
public class Node {
      private int id;
      private String title;
      private String content;
      private int uid;
      private Long creatTime;
      private Long modifiedTime;
}
