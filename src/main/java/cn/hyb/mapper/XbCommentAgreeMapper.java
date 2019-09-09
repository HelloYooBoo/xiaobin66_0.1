package cn.hyb.mapper;

import cn.hyb.pojo.XbCommentAgree;
import cn.hyb.pojo.XbCommentAgreeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbCommentAgreeMapper {
    int countByExample(XbCommentAgreeExample example);

    int deleteByExample(XbCommentAgreeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbCommentAgree record);

    int insertSelective(XbCommentAgree record);

    List<XbCommentAgree> selectByExample(XbCommentAgreeExample example);

    XbCommentAgree selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbCommentAgree record, @Param("example") XbCommentAgreeExample example);

    int updateByExample(@Param("record") XbCommentAgree record, @Param("example") XbCommentAgreeExample example);

    int updateByPrimaryKeySelective(XbCommentAgree record);

    int updateByPrimaryKey(XbCommentAgree record);
}