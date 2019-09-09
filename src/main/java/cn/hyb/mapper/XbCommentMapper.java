package cn.hyb.mapper;

import cn.hyb.pojo.XbComment;
import cn.hyb.pojo.XbCommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbCommentMapper {
    int countByExample(XbCommentExample example);

    int deleteByExample(XbCommentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbComment record);

    int insertSelective(XbComment record);

    List<XbComment> selectByExampleWithBLOBs(XbCommentExample example);

    List<XbComment> selectByExample(XbCommentExample example);

    XbComment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbComment record, @Param("example") XbCommentExample example);

    int updateByExampleWithBLOBs(@Param("record") XbComment record, @Param("example") XbCommentExample example);

    int updateByExample(@Param("record") XbComment record, @Param("example") XbCommentExample example);

    int updateByPrimaryKeySelective(XbComment record);

    int updateByPrimaryKeyWithBLOBs(XbComment record);

    int updateByPrimaryKey(XbComment record);
}