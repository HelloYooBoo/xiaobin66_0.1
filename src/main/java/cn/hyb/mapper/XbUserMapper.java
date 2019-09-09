package cn.hyb.mapper;

import cn.hyb.pojo.XbUser;
import cn.hyb.pojo.XbUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbUserMapper {
    int countByExample(XbUserExample example);

    int deleteByExample(XbUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbUser record);

    int insertSelective(XbUser record);

    List<XbUser> selectByExample(XbUserExample example);

    XbUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbUser record, @Param("example") XbUserExample example);

    int updateByExample(@Param("record") XbUser record, @Param("example") XbUserExample example);

    int updateByPrimaryKeySelective(XbUser record);

    int updateByPrimaryKey(XbUser record);
}