package cn.hyb.mapper;

import cn.hyb.pojo.XbPasserUser;
import cn.hyb.pojo.XbPasserUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbPasserUserMapper {
    int countByExample(XbPasserUserExample example);

    int deleteByExample(XbPasserUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbPasserUser record);

    int insertSelective(XbPasserUser record);

    List<XbPasserUser> selectByExample(XbPasserUserExample example);

    XbPasserUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbPasserUser record, @Param("example") XbPasserUserExample example);

    int updateByExample(@Param("record") XbPasserUser record, @Param("example") XbPasserUserExample example);

    int updateByPrimaryKeySelective(XbPasserUser record);

    int updateByPrimaryKey(XbPasserUser record);
}