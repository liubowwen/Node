package vip.wylbw.Mapper;

import org.apache.ibatis.annotations.*;
import vip.wylbw.Model.Node;

import java.util.List;
@Mapper
public interface NodeMapper {
     @Select("SELECT * from mynode.node order  by  creatTime desc")
     List<Node> findAll();
     @Insert("INSERT into mynode.node(title, content, uid,creatTime) values (#{title},#{content},#{uid},#{creatTime})")
     void  add(Node node);
     @Select("Select * from mynode.node where id=#{id}")
     Node  select(int id);
    @Delete("delete from mynode.node where id=#{id}")
     void delete(int id);
     @Update("update mynode.node set title=#{title},content=#{content},creatTime=#{creatTime} where id=#{id}")
    void update(Node node);
}
