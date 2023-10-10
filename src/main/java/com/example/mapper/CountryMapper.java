package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.model.Country;

@Mapper
public interface CountryMapper {
	
	@Select("select * from country")
	List<Country> selectAll();
	
	@Select("select distinct continent from country")
	List<String> selectContinents();
	
	@Select("select distinct region from country where continent = #{continent, jdbcType=VARCHAR}")
	List<String> selectRegions(String continent);
	
	@Select("select * from country where continent = #{continent}")
	List<Country> selectAllByContinent(String continent);
	
	@Select("select * from country where continent = #{continent} and region = #{region}")
	List<Country> selectAllByContinentAndRegion(@Param("continent")String continent, @Param("region")String region);
																								// 받아야할 매개변수가 2개 이상이면 @Param을 이용하여 매개변수 값을 쿼리문에 넣어준다.
	
}
