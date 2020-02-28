package com.ezwel.admin.persist.client;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezwel.admin.domain.entity.client.Client;
import com.ezwel.admin.domain.entity.client.ClientCommCd;
import com.ezwel.admin.domain.entity.client.ClientSub;
import com.ezwel.admin.service.client.dto.ClientDivisionDto;
import com.ezwel.admin.service.client.dto.ClientDto;
import com.ezwel.admin.service.client.dto.ClientSubDto;

@SuppressWarnings("PMD.UnusedModifier")
public interface ClientMapper {

	public List<Client> getClientList(ClientDto clientDto);

	public Client getClientSelectOne(ClientDto clientDto);

	public int getClientCnt(ClientDto clientDto);

	public void insertClient(ClientDto clientDto);

	public void insertTestUser(ClientDto clientDto);

	public void insertJedoPeriod(ClientDto clientDto);

	public void insertMgr(ClientDto clientDto);

	public void insertClientCommCd(ClientDto clientDto);

	public void insertAclUserAuth(ClientDto clientDto);

	public void updateClient(ClientDto clientDto);
	
	public List<Client> getmgrList(@Param("userType") String userType, @Param("branchCd") String branchCd);
	
	public void updateClientJedo(ClientDto clientDto);
	
	public String getDomainCd(String clientCd);
	
	public List<ClientCommCd> getCommCdList(ClientDto clientDto);

	public List<ClientCommCd> getCommClientList(HashMap<String,String> paramMap);
	
	public List<ClientCommCd> getPopCommCdList(ClientDto clientDto);
	
	public int getMaxClientCommCd(String clientCd);
	
	public int removeClientDivision(String clientCd);
	
	public List<String> getClientDivision(String clientCd);
	
	public int removeClientTopic(String clientCd);
	
	public List<String> getClientTopic(String clientCd);
	
	public int addClientCommCdDivision(ClientDivisionDto clientDivisionDto);
	
	public List<ClientSub> getClientMyPrivateList(String clientCd);
	
	public int addClientSub(ClientSubDto clientSubDto);
	
	public List<ClientSub> getClientSub(ClientSubDto clientSubDto);
	
	public int deleteClientSub(ClientSubDto clientSubDto);
	
	public int updateClientSub(ClientSubDto clientSubDto);
	
	public List<Client> getMenuURLtoClientList(String menuUrl);
	
	public int getMenuCdCnt(String menuCd);
	
	public List<Client> getBBSClient(String dataSeq);
	
	public String getCounselCdClientCd(String counselCd);
	
	public List<Client> getClientPagingList(ClientDto clientDto);
	
	public void insertGradeCd(ClientDto clientDto);

	public void modifyGradeCd(ClientDto clientDto);
	
	public void ajaxModifyGradeCdUseYn(ClientDto clientDto);
	
	public void modifyClientLogin(ClientDto clientDto);
	
	public List<ClientSub> getClientOnlinePollList(String clientCd);
	
	public List<Client> getClientStatusList(ClientDto clientDto);
	
	public String getClientJedoPeriod(ClientDto clientDto);
	
}