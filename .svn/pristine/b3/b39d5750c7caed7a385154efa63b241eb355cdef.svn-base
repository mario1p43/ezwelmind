package config.spring;

import java.io.IOException;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.jdbc.datasource.lookup.JndiDataSourceLookup;

import com.ezwel.core.framework.web.GlobalsProperties;

import config.RefreshableSqlSessionFactoryBean;
import net.sf.log4jdbc.Log4jdbcProxyDataSource;
import net.sf.log4jdbc.tools.Log4JdbcCustomFormatter;
import net.sf.log4jdbc.tools.LoggingType;

@ImportResource("classpath:config/spring/context-*.xml")
@Configuration
@MapperScan(basePackages="com.ezwel", sqlSessionFactoryRef="sqlSessionFactoryBean")
//@EnableTransactionManagement
public class ApplicationContext {
	@Value("#{global['server.type']}")	private String serverType;
	
	@Bean
	@Resource(name="jdbc/mariadb_ezwel_mind")
	public DataSource dataSource() {
		System.out.println("--- 1111");
		DataSource dataSource = null;
		
		JndiDataSourceLookup dsLookup = new JndiDataSourceLookup();
		dsLookup.setResourceRef(true);
		try {
			dataSource = dsLookup.getDataSource("java:comp/env/jdbc/mariadb_ezwel_mind");
			System.out.println("dataSource: " + dataSource);
		} catch(Exception e){
			System.err.println("Create Bean dataSource: " + e);
		}
		
		if (dataSource == null) {
			System.err.println("========== DATASOURCE NULL ==========");
		} else {
			// Local 일 경우 Log4Jdbc 및 정렬 Result Table 보기(log4jdbcRemi) 설정
			if (GlobalsProperties.LOCAL.equals(serverType) || GlobalsProperties.DEV.equals(serverType)) {
				System.out.println("========== Log4Jdbc & log4jdbcRemi 설정 ==========");
			    try {
			    	Log4JdbcCustomFormatter log4JdbcCustomFormatter = new Log4JdbcCustomFormatter();
			    	log4JdbcCustomFormatter.setLoggingType(LoggingType.MULTI_LINE);
			    	log4JdbcCustomFormatter.setSqlPrefix("SQL     :\n\t\t");
			    	
			    	Log4jdbcProxyDataSource log4jdbcProxyDataSource = new Log4jdbcProxyDataSource(dataSource);
			    	log4jdbcProxyDataSource.setLogFormatter(log4JdbcCustomFormatter);
			    	
			    	dataSource = log4jdbcProxyDataSource;
			    } catch(Exception e){
			    	System.err.println(e);
			    }
			}
		}
	    System.out.println("1: " + dataSource);
	    return dataSource;
	}
	
	
	/**
	 * 마이베티스 설정
	 * @param dataSource
	 * @param applicationContext
	 * @return
	 * @throws IOException
	 */
    @Bean
    public SqlSessionFactoryBean sqlSessionFactoryBean(DataSource dataSource, org.springframework.context.ApplicationContext applicationContext) throws IOException {
    	System.out.println("2: " + dataSource);
        SqlSessionFactoryBean sqlSessionFactoryBean = null;
        
        if (GlobalsProperties.LOCAL.equals(serverType)) {
        	System.out.println("=================== RefreshableSqlSessionFactoryBean ================ ");
        	sqlSessionFactoryBean = new RefreshableSqlSessionFactoryBean();
        } else {
        	System.out.println("=================== SqlSessionFactoryBean ================ ");
        	sqlSessionFactoryBean = new SqlSessionFactoryBean();
        }

        sqlSessionFactoryBean.setConfigLocation(applicationContext.getResource("classpath:config/mybatis/sqlMapConfig.xml"));
        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:com/ezwel/**/*.xml"));
        sqlSessionFactoryBean.setDataSource(dataSource);

        return sqlSessionFactoryBean;
    }
    
}
