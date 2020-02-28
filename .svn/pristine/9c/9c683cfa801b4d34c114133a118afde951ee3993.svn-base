package com.ezwel.core.support.util;

/**
 * EMS, SMS 수신대상자
 * 소속, 부서, 팀 정보
 * @author sinjw 2018. 3. 6.
 */
public interface EzwelCode {
	
	/**
	 * 소속
	 */
	public enum BRANCH {
		/**
		 * 이지웰니스 EAP본부
		 */
		Ezwellness("101028");
		
		public final String code;
		
		private BRANCH(final String code) {
			this.code = code;
		}
	}
	
	/**
	 * 부서
	 */
	public enum DEPT {
		/**
		 * EAP운영실
		 */
		EAPManagement("101029"),
		/**
		 * 컨설팅실
		 */
		Consulting("101030")
		;
		
		public final String code;
		
		private DEPT(final String code) {
			this.code = code;
		}
	}
	
	/**
	 * 팀
	 */
	public interface TEAM {
		/**
		 * EAP운영실
		 */
		public enum EAPManagement {
			/**
			 * 실장 
			 */
			GeneralManager("101031"),
			/**
			 * EAP마케팅팀 
			 */
			EAPMarketingTeam("101032"),
			/**
			 * 컨텐츠운영팀 
			 */
			ContentManagementTeam("101033");
			
			public final String code;
			
			private EAPManagement(final String code) {
				this.code = code;
			}
		}

		/**
		 * 컨설팅실
		 */
		public enum Consulting {
			
			/**
			 * 실장 
			 */
			GeneralManager("101034"),
			/**
			 * EAP사업1팀
			 */
			EAPBuisnessTeam1("101035"),
			/**
			 * EAP사업2팀 
			 */
			EAPBuisnessTeam2("101036"),
			/**
			 * 힐링사업팀 
			 */
			HealingBuisnessTeam("101037");
			
			public final String code;
			
			private Consulting(final String code) {
				this.code = code;
			}
		}
	}
}
