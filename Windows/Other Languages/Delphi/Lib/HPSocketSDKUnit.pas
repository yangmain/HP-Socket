unit HPSocketSDKUnit;

interface

uses
  Winapi.Windows, HPTypeDef;

type
  SOCKET = Pointer;

  PWSABUF = ^WSABUF;

  WSABUF = record
    len: Longint; { the length of the buffer }
    buf: PChar; { the pointer to the buffer }
  end { WSABUF };

  LPWSABUF = PWSABUF;

  WSABUFArray = array of WSABUF;

  PUShort = ^Word;

  { /************************************************************************
    ���ƣ����� Socket ����ָ�����ͱ���
    �������� Socket ����ָ�붨��Ϊ��ֱ�۵ı���
    ************************************************************************/ }
  HP_Object = PVOID;

  HP_Server = HP_Object;

  HP_Agent = HP_Object;

  HP_Client = HP_Object;

  HP_TcpServer = HP_Object;

  HP_TcpAgent = HP_Object;

  HP_TcpClient = HP_Object;

  HP_PullSocket = HP_Object;

  HP_PullClient = HP_Object;

  HP_TcpPullServer = HP_Object;

  HP_TcpPullAgent = HP_Object;

  HP_TcpPullClient = HP_Object;

  HP_PackSocket = HP_Object;

  HP_PackClient = HP_Object;

  HP_TcpPackServer = HP_Object;

  HP_TcpPackAgent = HP_Object;

  HP_TcpPackClient = HP_Object;

  HP_UdpServer = HP_Object;

  HP_UdpClient = HP_Object;

  HP_UdpCast = HP_Object;

  HP_UdpArqServer = HP_Object;

  HP_UdpArqClient = HP_Object;

  HP_Listener = HP_Object;

  HP_ServerListener = HP_Object;

  HP_AgentListener = HP_Object;

  HP_ClientListener = HP_Object;

  HP_TcpServerListener = HP_Object;

  HP_TcpAgentListener = HP_Object;

  HP_TcpClientListener = HP_Object;

  HP_PullSocketListener = HP_Object;

  HP_PullClientListener = HP_Object;

  HP_TcpPullServerListener = HP_Object;

  HP_TcpPullAgentListener = HP_Object;

  HP_TcpPullClientListener = HP_Object;

  HP_PackSocketListener = HP_Object;

  HP_PackClientListener = HP_Object;

  HP_TcpPackServerListener = HP_Object;

  HP_TcpPackAgentListener = HP_Object;

  HP_TcpPackClientListener = HP_Object;

  HP_UdpServerListener = HP_Object;

  HP_UdpClientListener = HP_Object;

  HP_UdpCastListener = HP_Object;

  HP_UdpArqServerListener = HP_Object;

  HP_UdpArqClientListener = HP_Object;

  HP_Http = HP_Object;

  HP_HttpServer = HP_Object;

  HP_HttpAgent = HP_Object;

  HP_HttpClient = HP_Object;

  HP_HttpSyncClient = HP_Object;

  HP_HttpServerListener = HP_Object;

  HP_HttpAgentListener = HP_Object;

  HP_HttpClientListener = HP_Object;

  HP_ThreadPool = HP_Object;

  // *****************************************************************************************************************************************************/
  // ****************************************************************** TCP/UDP Exports ******************************************************************/
  // *****************************************************************************************************************************************************/

  // ****************************************************/
  // ***************** TCP/UDP �ص����� ******************/

  // * Server �ص����� */
  HP_FN_Server_OnPrepareListen = function(pSender: HP_Server; soListen: UINT_PTR): En_HP_HandleResult; stdcall;

  // ���Ϊ TCP ���ӣ�pClientΪ SOCKET ��������Ϊ UDP ���ӣ�pClientΪ SOCKADDR_IN ָ�룻
  HP_FN_Server_OnAccept = function(pSender: HP_Server; dwConnID: HP_CONNID; pClient: UINT_PTR): En_HP_HandleResult; stdcall;

  HP_FN_Server_OnHandShake = function(pSender: HP_Server; dwConnID: HP_CONNID): En_HP_HandleResult; stdcall;

  HP_FN_Server_OnSend = function(pSender: HP_Server; dwConnID: HP_CONNID; const pData: PBYTE; iLength: Integer): En_HP_HandleResult; stdcall;

  HP_FN_Server_OnReceive = function(pSender: HP_Server; dwConnID: HP_CONNID; const pData: PBYTE; iLength: Integer): En_HP_HandleResult; stdcall;

  HP_FN_Server_OnPullReceive = function(pSender: HP_Server; dwConnID: HP_CONNID; iLength: Integer): En_HP_HandleResult; stdcall;

  HP_FN_Server_OnClose = function(pSender: HP_Server; dwConnID: HP_CONNID; enOperation: En_HP_SocketOperation; iErrorCode: Integer): En_HP_HandleResult; stdcall;

  HP_FN_Server_OnShutdown = function(pSender: HP_Server): En_HP_HandleResult; stdcall;

  // * Agent �ص����� */
  HP_FN_Agent_OnPrepareConnect = function(pSender: HP_Agent; dwConnID: HP_CONNID; SOCKET: UINT_PTR): En_HP_HandleResult; stdcall;

  HP_FN_Agent_OnConnect = function(pSender: HP_Agent; dwConnID: HP_CONNID): En_HP_HandleResult; stdcall;

  HP_FN_Agent_OnHandShake = function(pSender: HP_Agent; dwConnID: HP_CONNID): En_HP_HandleResult; stdcall;

  HP_FN_Agent_OnSend = function(pSender: HP_Agent; dwConnID: HP_CONNID; const pData: PBYTE; iLength: Integer): En_HP_HandleResult; stdcall;

  HP_FN_Agent_OnReceive = function(pSender: HP_Agent; dwConnID: HP_CONNID; const pData: PBYTE; iLength: Integer): En_HP_HandleResult; stdcall;

  HP_FN_Agent_OnPullReceive = function(pSender: HP_Agent; dwConnID: HP_CONNID; iLength: Integer): En_HP_HandleResult; stdcall;

  HP_FN_Agent_OnClose = function(pSender: HP_Agent; dwConnID: HP_CONNID; enOperation: En_HP_SocketOperation; iErrorCode: Integer): En_HP_HandleResult; stdcall;

  HP_FN_Agent_OnShutdown = function(pSender: HP_Agent): En_HP_HandleResult; stdcall;

  // * Client �ص����� */
  HP_FN_Client_OnPrepareConnect = function(pSender: HP_Client; dwConnID: HP_CONNID; SOCKET: UINT_PTR): En_HP_HandleResult; stdcall;

  HP_FN_Client_OnConnect = function(pSender: HP_Client; dwConnID: HP_CONNID): En_HP_HandleResult; stdcall;

  HP_FN_Client_OnHandShake = function(pSender: HP_Client; dwConnID: HP_CONNID): En_HP_HandleResult; stdcall;

  HP_FN_Client_OnSend = function(pSender: HP_Client; dwConnID: HP_CONNID; const pData: PBYTE; iLength: Integer): En_HP_HandleResult; stdcall;

  HP_FN_Client_OnReceive = function(pSender: HP_Client; dwConnID: HP_CONNID; const pData: PBYTE; iLength: Integer): En_HP_HandleResult; stdcall;

  HP_FN_Client_OnPullReceive = function(pSender: HP_Client; dwConnID: HP_CONNID; iLength: Integer): En_HP_HandleResult; stdcall;

  HP_FN_Client_OnClose = function(pSender: HP_Client; dwConnID: HP_CONNID; enOperation: En_HP_SocketOperation; iErrorCode: Integer): En_HP_HandleResult; stdcall;

  // ****************************************************/
  // *************** TCP/UDP ���󴴽����� ****************/

  // ���� HP_TcpServer ����
function Create_HP_TcpServer(pListener: HP_TcpServerListener): HP_TcpServer; stdcall; external HPSocketDLL;
// ���� HP_TcpAgent ����

function Create_HP_TcpAgent(pListener: HP_TcpAgentListener): HP_TcpAgent; stdcall; external HPSocketDLL;
// ���� HP_TcpClient ����

function Create_HP_TcpClient(pListener: HP_TcpClientListener): HP_TcpClient; stdcall; external HPSocketDLL;

// ���� HP_TcpPullServer ����
function Create_HP_TcpPullServer(pListener: HP_TcpPullServerListener): HP_TcpPullServer; stdcall; external HPSocketDLL;
// ���� HP_TcpPullAgent ����

function Create_HP_TcpPullAgent(pListener: HP_TcpPullAgentListener): HP_TcpPullAgent; stdcall; external HPSocketDLL;
// ���� HP_TcpPullClient ����

function Create_HP_TcpPullClient(pListener: HP_TcpPullClientListener): HP_TcpPullClient; stdcall; external HPSocketDLL;

// ���� HP_TcpPackServer ����
function Create_HP_TcpPackServer(pListener: HP_TcpServerListener): HP_TcpPackServer; stdcall; external HPSocketDLL;
// ���� HP_TcpPackAgent ����

function Create_HP_TcpPackAgent(pListener: HP_TcpAgentListener): HP_TcpPackAgent; stdcall; external HPSocketDLL;
// ���� HP_TcpPackClient ����

function Create_HP_TcpPackClient(pListener: HP_TcpClientListener): HP_TcpPackClient; stdcall; external HPSocketDLL;

// ���� HP_UdpServer ����
function Create_HP_UdpServer(pListener: HP_UdpServerListener): HP_UdpServer; stdcall; external HPSocketDLL;
// ���� HP_UdpClient ����

function Create_HP_UdpClient(pListener: HP_UdpClientListener): HP_UdpClient; stdcall; external HPSocketDLL;
// ���� HP_UdpCast ����

function Create_HP_UdpCast(pListener: HP_UdpCastListener): HP_UdpCast; stdcall; external HPSocketDLL;
// ���� HP_UdpArqServer ����: //;

function Create_HP_UdpArqServer(pListener: HP_UdpServerListener): HP_UdpArqServer; stdcall; external HPSocketDLL;
// ���� HP_UdpArqClient ����: //;

function Create_HP_UdpArqClient(pListener: HP_UdpClientListener): HP_UdpArqClient; stdcall; external HPSocketDLL;

// ���� HP_TcpServer ����
procedure Destroy_HP_TcpServer(pServer: HP_TcpServer); stdcall; external HPSocketDLL;
// ���� HP_TcpAgent ����

procedure Destroy_HP_TcpAgent(pAgent: HP_TcpAgent); stdcall; external HPSocketDLL;
// ���� HP_TcpClient ����

procedure Destroy_HP_TcpClient(pClient: HP_TcpClient); stdcall; external HPSocketDLL;
// ���� HP_UdpArqServer ����:

procedure Destroy_HP_UdpArqServer(pServer: HP_UdpArqServer); external HPSocketDLL;
// ���� HP_UdpArqClient ����:

procedure Destroy_HP_UdpArqClient(pClient: HP_UdpArqClient); external HPSocketDLL;

// ���� HP_TcpPullServer ����
procedure Destroy_HP_TcpPullServer(pServer: HP_TcpPullServer); stdcall; external HPSocketDLL;
// ���� HP_TcpPullAgent ����

procedure Destroy_HP_TcpPullAgent(pAgent: HP_TcpPullAgent); stdcall; external HPSocketDLL;
// ���� HP_TcpPullClient ����

procedure Destroy_HP_TcpPullClient(pClient: HP_TcpPullClient); stdcall; external HPSocketDLL;

// ���� HP_TcpPackServer ����
procedure Destroy_HP_TcpPackServer(pServer: HP_TcpPackServer); stdcall; external HPSocketDLL;
// ���� HP_TcpPackAgent ����

procedure Destroy_HP_TcpPackAgent(pAgent: HP_TcpPackAgent); stdcall; external HPSocketDLL;
// ���� HP_TcpPackClient ����

procedure Destroy_HP_TcpPackClient(pClient: HP_TcpPackClient); stdcall; external HPSocketDLL;

// ���� HP_UdpServer ����
procedure Destroy_HP_UdpServer(pServer: HP_UdpServer); stdcall; external HPSocketDLL;
// ���� HP_UdpClient ����

procedure Destroy_HP_UdpClient(pClient: HP_UdpClient); stdcall; external HPSocketDLL;
// ���� HP_UdpCast ����

procedure Destroy_HP_UdpCast(pCast: HP_UdpCast); stdcall; external HPSocketDLL;

// ���� HP_TcpServerListener ����
function Create_HP_TcpServerListener(): HP_TcpServerListener; stdcall; external HPSocketDLL;
// ���� HP_TcpAgentListener ����

function Create_HP_TcpAgentListener(): HP_TcpAgentListener; stdcall; external HPSocketDLL;
// ���� HP_TcpClientListener ����

function Create_HP_TcpClientListener(): HP_TcpClientListener; stdcall; external HPSocketDLL;

// ���� HP_TcpPullServerListener ����
function Create_HP_TcpPullServerListener(): HP_TcpPullServerListener; stdcall; external HPSocketDLL;
// ���� HP_TcpPullAgentListener ����

function Create_HP_TcpPullAgentListener(): HP_TcpPullAgentListener; stdcall; external HPSocketDLL;
// ���� HP_TcpPullClientListener ����

function Create_HP_TcpPullClientListener(): HP_TcpPullClientListener; stdcall; external HPSocketDLL;

// ���� HP_TcpPackServerListener ����
function Create_HP_TcpPackServerListener(): HP_TcpPackServerListener; stdcall; external HPSocketDLL;
// ���� HP_TcpPackAgentListener ����

function Create_HP_TcpPackAgentListener(): HP_TcpPackAgentListener; stdcall; external HPSocketDLL;
// ���� HP_TcpPackClientListener ����

function Create_HP_TcpPackClientListener(): HP_TcpPackClientListener; stdcall; external HPSocketDLL;

// ���� HP_UdpServerListener ����
function Create_HP_UdpServerListener(): HP_UdpServerListener; stdcall; external HPSocketDLL;
// ���� HP_UdpClientListener ����

function Create_HP_UdpClientListener(): HP_UdpClientListener; stdcall; external HPSocketDLL;
// ���� HP_UdpCastListener ����

function Create_HP_UdpCastListener(): HP_UdpCastListener; stdcall; external HPSocketDLL;
// ���� HP_UdpArqServerListener ����

function Create_HP_UdpArqServerListener(): HP_UdpArqServerListener; stdcall; external HPSocketDLL;
// ���� HP_UdpArqClientListener ����

function Create_HP_UdpArqClientListener(): HP_UdpArqClientListener; stdcall; external HPSocketDLL;

// ���� HP_TcpServerListener ����
procedure Destroy_HP_TcpServerListener(pListener: HP_TcpServerListener); stdcall; external HPSocketDLL;
// ���� HP_TcpAgentListener ����

procedure Destroy_HP_TcpAgentListener(pListener: HP_TcpAgentListener); stdcall; external HPSocketDLL;
// ���� HP_TcpClientListener ����

procedure Destroy_HP_TcpClientListener(pListener: HP_TcpClientListener); stdcall; external HPSocketDLL;
// ���� HP_UdpArqServerListener ����

procedure Destroy_HP_UdpArqServerListener(pListener: HP_UdpArqServerListener); stdcall; external HPSocketDLL;
// ���� HP_UdpArqClientListener ����

procedure Destroy_HP_UdpArqClientListener(pListener: HP_UdpArqClientListener); stdcall; external HPSocketDLL;

// ���� HP_TcpPullServerListener ����
procedure Destroy_HP_TcpPullServerListener(pListener: HP_TcpPullServerListener); stdcall; external HPSocketDLL;
// ���� HP_TcpPullAgentListener ����

procedure Destroy_HP_TcpPullAgentListener(pListener: HP_TcpPullAgentListener); stdcall; external HPSocketDLL;
// ���� HP_TcpPullClientListener ����

procedure Destroy_HP_TcpPullClientListener(pListener: HP_TcpPullClientListener); stdcall; external HPSocketDLL;

// ���� HP_TcpPackServerListener ����
procedure Destroy_HP_TcpPackServerListener(pListener: HP_TcpPackServerListener); stdcall; external HPSocketDLL;
// ���� HP_TcpPackAgentListener ����

procedure Destroy_HP_TcpPackAgentListener(pListener: HP_TcpPackAgentListener); stdcall; external HPSocketDLL;
// ���� HP_TcpPackClientListener ����

procedure Destroy_HP_TcpPackClientListener(pListener: HP_TcpPackClientListener); stdcall; external HPSocketDLL;

// ���� HP_UdpServerListener ����
procedure Destroy_HP_UdpServerListener(pListener: HP_UdpServerListener); stdcall; external HPSocketDLL;
// ���� HP_UdpClientListener ����

procedure Destroy_HP_UdpClientListener(pListener: HP_UdpClientListener); stdcall; external HPSocketDLL;
// ���� HP_UdpCastListener ����

procedure Destroy_HP_UdpCastListener(pListener: HP_UdpCastListener); stdcall; external HPSocketDLL;

// **********************************************************************************/
// ***************************** Server �ص��������÷��� *****************************/
procedure HP_Set_FN_Server_OnPrepareListen(pListener: HP_ServerListener; fn: HP_FN_Server_OnPrepareListen); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Server_OnAccept(pListener: HP_ServerListener; fn: HP_FN_Server_OnAccept); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Server_OnHandShake(pListener: HP_ServerListener; fn: HP_FN_Server_OnHandShake); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Server_OnSend(pListener: HP_ServerListener; fn: HP_FN_Server_OnSend); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Server_OnReceive(pListener: HP_ServerListener; fn: HP_FN_Server_OnReceive); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Server_OnPullReceive(pListener: HP_ServerListener; fn: HP_FN_Server_OnPullReceive); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Server_OnClose(pListener: HP_ServerListener; fn: HP_FN_Server_OnClose); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Server_OnShutdown(pListener: HP_ServerListener; fn: HP_FN_Server_OnShutdown); stdcall; external HPSocketDLL;

// **********************************************************************************/
// ****************************** Agent �ص��������÷��� *****************************/
procedure HP_Set_FN_Agent_OnPrepareConnect(pListener: HP_AgentListener; fn: HP_FN_Agent_OnPrepareConnect); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Agent_OnConnect(pListener: HP_AgentListener; fn: HP_FN_Agent_OnConnect); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Agent_OnHandShake(pListener: HP_AgentListener; fn: HP_FN_Agent_OnHandShake); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Agent_OnSend(pListener: HP_AgentListener; fn: HP_FN_Agent_OnSend); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Agent_OnReceive(pListener: HP_AgentListener; fn: HP_FN_Agent_OnReceive); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Agent_OnPullReceive(pListener: HP_AgentListener; fn: HP_FN_Agent_OnPullReceive); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Agent_OnClose(pListener: HP_AgentListener; fn: HP_FN_Agent_OnClose); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Agent_OnShutdown(pListener: HP_AgentListener; fn: HP_FN_Agent_OnShutdown); stdcall; external HPSocketDLL;

// **********************************************************************************/
// ***************************** Client �ص��������÷��� *****************************/
procedure HP_Set_FN_Client_OnPrepareConnect(pListener: HP_ClientListener; fn: HP_FN_Client_OnPrepareConnect); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Client_OnConnect(pListener: HP_ClientListener; fn: HP_FN_Client_OnConnect); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Client_OnHandShake(pListener: HP_ClientListener; fn: HP_FN_Client_OnHandShake); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Client_OnSend(pListener: HP_ClientListener; fn: HP_FN_Client_OnSend); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Client_OnReceive(pListener: HP_ClientListener; fn: HP_FN_Client_OnReceive); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Client_OnPullReceive(pListener: HP_ClientListener; fn: HP_FN_Client_OnPullReceive); stdcall; external HPSocketDLL;

procedure HP_Set_FN_Client_OnClose(pListener: HP_ClientListener; fn: HP_FN_Client_OnClose); stdcall; external HPSocketDLL;

// **************************************************************************/
// ***************************** Server �������� *****************************/

{ //*
  * ���ƣ�����ͨ�����
  * ���������������ͨ�������������ɺ�ɿ�ʼ���տͻ������Ӳ��շ�����
  *
  * ������		lpszBindAddress	-- ������ַ
  *			usPort			-- �����˿�
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� HP_Server_GetLastError() ��ȡ�������
  */ }
function HP_Server_Start(pServer: HP_Server; lpszBindAddress: PChar; usPort: USHORT): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ��ر�ͨ�����
  * �������رշ����ͨ��������ر���ɺ�Ͽ����пͻ������Ӳ��ͷ�������Դ
  *
  * ������
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� HP_Server_GetLastError() ��ȡ�������
  */ }
function HP_Server_Stop(pServer: HP_Server): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ���������
  * ��������ָ�����ӷ�������
  *
  * ������		dwConnID	-- ���� ID
  *			pBuffer		-- ���ͻ�����
  *			iLength		-- ���ͻ���������
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_Server_Send(pServer: HP_Server; dwConnID: HP_CONNID; const pBuffer: PBYTE; iLength: Integer): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ���������
  * ��������ָ�����ӷ�������
  *
  * ������		dwConnID	-- ���� ID
  *			pBuffer		-- ���ͻ�����
  *			iLength		-- ���ͻ���������
  *			iOffset		-- ���ͻ�����ָ��ƫ����
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_Server_SendPart(pServer: HP_Server; dwConnID: HP_CONNID; const pBuffer: PBYTE; iLength: Integer; iOffset: Integer): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ����Ͷ�������
  * ��������ָ�����ӷ��Ͷ�������
  *		TCP - ˳�����������ݰ�
  *		UDP - ���������ݰ���ϳ�һ�����ݰ����ͣ����ݰ����ܳ��Ȳ��ܴ������õ� UDP ����󳤶ȣ�
  *
  * ������		dwConnID	-- ���� ID
  *			pBuffers	-- ���ͻ���������
  *			iCount		-- ���ͻ�������Ŀ
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_Server_SendPackets(pServer: HP_Server; dwConnID: HP_CONNID; const pBuffers: WSABUFArray; iCount: Integer): BOOL; stdcall; external HPSocketDLL;

{ /*
  * ���ƣ���ͣ/�ָ�����
  * ��������ͣ/�ָ�ĳ�����ӵ����ݽ��չ���
  *
  * ������		dwConnID	-- ���� ID
  *			      bPause		-- TRUE - ��ͣ, FALSE - �ָ�
  * ����ֵ��	TRUE	-- �ɹ�
  *			      FALSE	-- ʧ��
  */ }
function HP_Server_PauseReceive(pServer: HP_Server; dwConnID: HP_CONNID; bPause: BOOL): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ��Ͽ�����
  * �������Ͽ���ĳ���ͻ��˵�����
  *
  * ������		dwConnID	-- ���� ID
  *			bForce		-- �Ƿ�ǿ�ƶϿ�����
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ��
  */ }
function HP_Server_Disconnect(pServer: HP_Server; dwConnID: HP_CONNID; bForce: BOOL): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ��Ͽ���ʱ����
  * �������Ͽ�����ָ��ʱ��������
  *
  * ������		dwPeriod	-- ʱ�������룩
  *			      bForce		-- �Ƿ�ǿ�ƶϿ�����
  * ����ֵ��	TRUE	-- �ɹ�
  *			      FALSE	-- ʧ��
  */ }
function HP_Server_DisconnectLongConnections(pServer: HP_Server; dwPeriod: DWORD; bForce: BOOL): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ��Ͽ���Ĭ����
  * �������Ͽ�����ָ��ʱ���ľ�Ĭ����
  *
  * ������		dwPeriod	-- ʱ�������룩
  *			      bForce		-- �Ƿ�ǿ�ƶϿ�����
  * ����ֵ��	TRUE	-- �ɹ�
  *			      FALSE	-- ʧ��
  */ }
function HP_Server_DisconnectSilenceConnections(pServer: HP_Server; dwPeriod: DWORD; bForce: BOOL): BOOL; stdcall; external HPSocketDLL;

// ******************************************************************************/
// ***************************** Server ���Է��ʷ��� *****************************/

{ //*
  * ���ƣ��������ӵĸ�������
  * �������Ƿ�Ϊ���Ӱ󶨸������ݻ��߰�ʲô�������ݣ�����Ӧ�ó���ֻ������
  *
  * ������		dwConnID	-- ���� ID
  *			      pv			-- ����
  * ����ֵ��	TRUE	-- �ɹ�
  *			      FALSE	-- ʧ�ܣ���Ч������ ID��
  */ }
function HP_Server_SetConnectionExtra(pServer: HP_Server; dwConnID: HP_CONNID; pExtra: PVOID): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ���ȡ���ӵĸ�������
  * �������Ƿ�Ϊ���Ӱ󶨸������ݻ��߰�ʲô�������ݣ�����Ӧ�ó���ֻ������
  *
  * ������		dwConnID	-- ���� ID
  *			      ppv			-- ����ָ��
  * ����ֵ��	TRUE	-- �ɹ�
  *			      FALSE	-- ʧ�ܣ���Ч������ ID��
  */ }
function HP_Server_GetConnectionExtra(pServer: HP_Server; dwConnID: HP_CONNID; var ppExtra: PVOID): BOOL; stdcall; external HPSocketDLL;

// ����Ƿ�Ϊ��ȫ���ӣ�SSL/HTTPS��
function HP_Server_IsSecure(pServer: HP_Server): BOOL; stdcall; external HPSocketDLL;

// * ���ͨ������Ƿ������� */
function HP_Server_HasStarted(pServer: HP_Server): BOOL; stdcall; external HPSocketDLL;
// * �鿴ͨ�������ǰ״̬ */

function HP_Server_GetState(pServer: HP_Server): En_HP_ServiceState; stdcall; external HPSocketDLL;
// * ��ȡ���һ��ʧ�ܲ����Ĵ������ */

function HP_Server_GetLastError(pServer: HP_Server): En_HP_SocketError; stdcall; external HPSocketDLL;
// * ��ȡ���һ��ʧ�ܲ����Ĵ������� */

function HP_Server_GetLastErrorDesc(pServer: HP_Server): PChar; stdcall; external HPSocketDLL;
// * ��ȡ������δ�������ݵĳ��� */

function HP_Server_GetPendingDataLength(pServer: HP_Server; dwConnID: HP_CONNID; var piPending: Integer): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ���ӵ����ݽ���״̬ */

function HP_Server_IsPauseReceive(pServer: HP_Server; dwConnID: HP_CONNID; var pbPaused: BOOL): BOOL; stdcall; external HPSocketDLL;
// * ����Ƿ���Ч���� */

function HP_Server_IsConnected(pServer: HP_Server; dwConnID: HP_CONNID): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ�ͻ��������� */

function HP_Server_GetConnectionCount(pServer: HP_Server): Word; stdcall; external HPSocketDLL;
// * ��ȡ�������ӵ� HP_CONNID */

function HP_Server_GetAllConnectionIDs(pServer: HP_Server; pIDs: HP_CONNIDArray; var pdwCount: DWORD): BOOL; stdcall; external HPSocketDLL;
// * ��ȡĳ���ͻ�������ʱ�������룩 */

function HP_Server_GetConnectPeriod(pServer: HP_Server; dwConnID: HP_CONNID; var pdwPeriod: DWORD): BOOL; stdcall; external HPSocketDLL;
// * ��ȡĳ�����Ӿ�Ĭʱ�䣨���룩 */

function HP_Server_GetSilencePeriod(pServer: HP_Server; dwConnID: HP_CONNID; var pdwPeriod: DWORD): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ���� Socket �ĵ�ַ��Ϣ */

function HP_Server_GetListenAddress(pServer: HP_Server; lpszAddress: PChar; var piAddressLen: Integer; var pusPort: Word): BOOL; stdcall; external HPSocketDLL;
// * ��ȡĳ�����ӵı��ص�ַ��Ϣ */

function HP_Server_GetLocalAddress(pServer: HP_Server; dwConnID: HP_CONNID; lpszAddress: PChar; var piAddressLen: Integer; var pusPort: Word): BOOL; stdcall; external HPSocketDLL;
// * ��ȡĳ�����ӵ�Զ�̵�ַ��Ϣ */

function HP_Server_GetRemoteAddress(pServer: HP_Server; dwConnID: HP_CONNID; lpszAddress: PChar; var piAddressLen: Integer; var pusPort: Word): BOOL; stdcall; external HPSocketDLL;

// * �������ݷ��Ͳ��� */
procedure HP_Server_SetSendPolicy(pServer: HP_Server; enSendPolicy: En_HP_SendPolicy); stdcall; external HPSocketDLL;
// * ���� OnSend �¼�ͬ�����ԣ�Ĭ�ϣ�OSSP_NONE����ͬ���� */

procedure HP_Server_SetOnSendSyncPolicy(pServer: HP_Server; enSyncPolicy: En_HP_OnSendSyncPolicy); stdcall; external HPSocketDLL;
// * ���� Socket �����������ʱ�䣨���룬�������ڼ�� Socket ��������ܱ���ȡʹ�ã� */

procedure HP_Server_SetFreeSocketObjLockTime(pServer: HP_Server; dwFreeSocketObjLockTime: DWORD); stdcall; external HPSocketDLL;
// * ���� Socket ����ش�С��ͨ������Ϊƽ���������������� 1/3 - 1/2�� */

procedure HP_Server_SetFreeSocketObjPool(pServer: HP_Server; dwFreeSocketObjPool: DWORD); stdcall; external HPSocketDLL;
// * �����ڴ�黺��ش�С��ͨ������Ϊ Socket ����ش�С�� 2 - 3 ���� */

procedure HP_Server_SetFreeBufferObjPool(pServer: HP_Server; dwFreeBufferObjPool: DWORD); stdcall; external HPSocketDLL;
// * ���� Socket ����ػ��շ�ֵ��ͨ������Ϊ Socket ����ش�С�� 3 ���� */

procedure HP_Server_SetFreeSocketObjHold(pServer: HP_Server; dwFreeSocketObjHold: DWORD); stdcall; external HPSocketDLL;
// * �����ڴ�黺��ػ��շ�ֵ��ͨ������Ϊ�ڴ�黺��ش�С�� 3 ���� */

procedure HP_Server_SetFreeBufferObjHold(pServer: HP_Server; dwFreeBufferObjHold: DWORD); stdcall; external HPSocketDLL;
// * ���������������������������ֵԤ�����ڴ棬�����Ҫ����ʵ��������ã����˹���*/

procedure HP_Server_SetMaxConnectionCount(pServer: HP_Server; dwMaxConnectionCount: DWORD); stdcall; external HPSocketDLL;
// * ���ù����߳�������ͨ������Ϊ 2 * CPU + 2�� */

procedure HP_Server_SetWorkerThreadCount(pServer: HP_Server; dwWorkerThreadCount: DWORD); stdcall; external HPSocketDLL;
// * �����Ƿ��Ǿ�Ĭʱ�䣨����Ϊ TRUE ʱ DisconnectSilenceConnections() �� GetSilencePeriod() ����Ч��Ĭ�ϣ�TRUE�� */

procedure HP_Server_SetMarkSilence(pServer: HP_Server; bMarkSilence: BOOL); stdcall; external HPSocketDLL;

// * ��ȡ���ݷ��Ͳ��� */
function HP_Server_GetSendPolicy(pServer: HP_Server): En_HP_SendPolicy; stdcall; external HPSocketDLL;
// * ��ȡ OnSend �¼�ͬ������ */

function HP_Server_GetOnSendSyncPolicy(pServer: HP_Server): En_HP_OnSendSyncPolicy; stdcall; external HPSocketDLL;
// * ��ȡ Socket �����������ʱ�� */

function HP_Server_GetFreeSocketObjLockTime(pServer: HP_Server): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ Socket ����ش�С */

function HP_Server_GetFreeSocketObjPool(pServer: HP_Server): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�ڴ�黺��ش�С */

function HP_Server_GetFreeBufferObjPool(pServer: HP_Server): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ Socket ����ػ��շ�ֵ */

function HP_Server_GetFreeSocketObjHold(pServer: HP_Server): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�ڴ�黺��ػ��շ�ֵ */

function HP_Server_GetFreeBufferObjHold(pServer: HP_Server): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ��������� */

function HP_Server_GetMaxConnectionCount(pServer: HP_Server): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�����߳����� */

function HP_Server_GetWorkerThreadCount(pServer: HP_Server): DWORD; stdcall; external HPSocketDLL;
// * ����Ƿ��Ǿ�Ĭʱ�� */

function HP_Server_IsMarkSilence(pServer: HP_Server): BOOL; stdcall; external HPSocketDLL;

// **********************************************************************************/
// ******************************* TCP Server �������� *******************************/

{ //*
  * ���ƣ�����С�ļ�
  * ��������ָ�����ӷ��� 4096 KB ���µ�С�ļ�
  *
  * ������		dwConnID		-- ���� ID
  *			lpszFileName	-- �ļ�·��
  *			pHead			-- ͷ����������
  *			pTail			-- β����������
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_TcpServer_SendSmallFile(pServer: HP_Server; dwConnID: HP_CONNID; lpszFileName: PChar; const pHead: LPWSABUF; const pTail: LPWSABUF): BOOL; stdcall; external HPSocketDLL;

// **********************************************************************************/
// ***************************** TCP Server ���Է��ʷ��� *****************************/

// * ���ü��� Socket �ĵȺ���д�С�����ݲ������������������ã� */
procedure HP_TcpServer_SetSocketListenQueue(pServer: HP_TcpServer; dwSocketListenQueue: DWORD); stdcall; external HPSocketDLL;
// * ���� Accept ԤͶ�����������ݸ��ص������ã�Accept ԤͶ������Խ����֧�ֵĲ�����������Խ�ࣩ */

procedure HP_TcpServer_SetAcceptSocketCount(pServer: HP_TcpServer; dwAcceptSocketCount: DWORD); stdcall; external HPSocketDLL;
// * ����ͨ�����ݻ�������С������ƽ��ͨ�����ݰ���С�������ã�ͨ������Ϊ 1024 �ı����� */

procedure HP_TcpServer_SetSocketBufferSize(pServer: HP_TcpServer; dwSocketBufferSize: DWORD); stdcall; external HPSocketDLL;
// * ����������������������룬0 �򲻷�����������Ĭ�ϣ�30 * 1000�� */

procedure HP_TcpServer_SetKeepAliveTime(pServer: HP_TcpServer; dwKeepAliveTime: DWORD); stdcall; external HPSocketDLL;
// * �����쳣��������������룬0 ����������������Ĭ�ϣ�10 * 1000������������ɴ� [Ĭ�ϣ�WinXP 5 ��, Win7 10 ��] ��ⲻ������ȷ�ϰ�����Ϊ�Ѷ��ߣ� */

procedure HP_TcpServer_SetKeepAliveInterval(pServer: HP_TcpServer; dwKeepAliveInterval: DWORD); stdcall; external HPSocketDLL;

// * ��ȡ Accept ԤͶ������ */
function HP_TcpServer_GetAcceptSocketCount(pServer: HP_TcpServer): DWORD; stdcall; external HPSocketDLL;
// * ��ȡͨ�����ݻ�������С */

function HP_TcpServer_GetSocketBufferSize(pServer: HP_TcpServer): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ���� Socket �ĵȺ���д�С */

function HP_TcpServer_GetSocketListenQueue(pServer: HP_TcpServer): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ������������� */

function HP_TcpServer_GetKeepAliveTime(pServer: HP_TcpServer): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�쳣��������� */

function HP_TcpServer_GetKeepAliveInterval(pServer: HP_TcpServer): DWORD; stdcall; external HPSocketDLL;

// **********************************************************************************/
// ***************************** UDP Server ���Է��ʷ��� *****************************/

// * �������ݱ�����󳤶ȣ������ھ����������²����� 1472 �ֽڣ��ڹ����������²����� 548 �ֽڣ� */
procedure HP_UdpServer_SetMaxDatagramSize(pServer: HP_UdpServer; dwMaxDatagramSize: DWORD); stdcall; external HPSocketDLL;
// * ��ȡ���ݱ�����󳤶� */

function HP_UdpServer_GetMaxDatagramSize(pServer: HP_UdpServer): DWORD; stdcall; external HPSocketDLL;
// * ���� Receive ԤͶ�����������ݸ��ص������ã�Receive ԤͶ������Խ���򶪰�����ԽС�� */

procedure HP_UdpServer_SetPostReceiveCount(pServer: HP_UdpServer; dwPostReceiveCount: DWORD); stdcall; external HPSocketDLL;
// * ��ȡ Receive ԤͶ������ */

function HP_UdpServer_GetPostReceiveCount(pServer: HP_UdpServer): DWORD; stdcall; external HPSocketDLL;
// * ���ü������Դ�����0 �򲻷��ͼ�������������������Դ�������Ϊ�Ѷ��ߣ� */

procedure HP_UdpServer_SetDetectAttempts(pServer: HP_UdpServer; dwDetectAttempts: DWORD); stdcall; external HPSocketDLL;
// * ���ü������ͼ�����룬0 �����ͼ����� */

procedure HP_UdpServer_SetDetectInterval(pServer: HP_UdpServer; dwDetectInterval: DWORD); stdcall; external HPSocketDLL;
// * ��ȡ���������� */

function HP_UdpServer_GetDetectAttempts(pServer: HP_UdpServer): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ��������� */

function HP_UdpServer_GetDetectInterval(pServer: HP_UdpServer): DWORD; stdcall; external HPSocketDLL;

// *************************** UDP ARQ Server ���Է��ʷ��� ***************************/

// * �����Ƿ��� nodelay ģʽ��Ĭ�ϣ�FALSE���������� */
procedure HP_UdpArqServer_SetNoDelay(pServer: HP_UdpArqServer; bNoDelay: Boolean); stdcall; external HPSocketDLL;
// * �����Ƿ�ر�ӵ�����ƣ�Ĭ�ϣ�FALSE�����رգ� */

procedure HP_UdpArqServer_SetTurnoffCongestCtrl(pServer: HP_UdpArqServer; bTurnOff: Boolean); stdcall; external HPSocketDLL;
// * ��������ˢ�¼�������룬Ĭ�ϣ�60�� */

procedure HP_UdpArqServer_SetFlushInterval(pServer: HP_UdpArqServer; dwFlushInterval: DWORD); stdcall; external HPSocketDLL;
// * ���ÿ����ش� ACK ��Խ������Ĭ�ϣ�0���رտ����ش��� */

procedure HP_UdpArqServer_SetResendByAcks(pServer: HP_UdpArqServer; dwResendByAcks: DWORD); stdcall; external HPSocketDLL;
// * ���÷��ʹ��ڴ�С�����ݰ�������Ĭ�ϣ�128�� */

procedure HP_UdpArqServer_SetSendWndSize(pServer: HP_UdpArqServer; dwSendWndSize: DWORD); stdcall; external HPSocketDLL;
// * ���ý��մ��ڴ�С�����ݰ�������Ĭ�ϣ�512�� */

procedure HP_UdpArqServer_SetRecvWndSize(pServer: HP_UdpArqServer; dwRecvWndSize: DWORD); stdcall; external HPSocketDLL;
// * ������С�ش���ʱʱ�䣨���룬Ĭ�ϣ�30�� */

procedure HP_UdpArqServer_SetMinRto(pServer: HP_UdpArqServer; dwMinRto: DWORD); stdcall; external HPSocketDLL;
// * ��������䵥Ԫ��Ĭ�ϣ�0���� SetMaxDatagramSize(pServer:) һ�£� */

procedure HP_UdpArqServer_SetMaxTransUnit(pServer: HP_UdpArqServer; dwMaxTransUnit: DWORD); stdcall; external HPSocketDLL;
// * ����������ݰ���С��Ĭ�ϣ�4096�� */

procedure HP_UdpArqServer_SetMaxMessageSize(pServer: HP_UdpArqServer; dwMaxMessageSize: DWORD); stdcall; external HPSocketDLL;
// * �������ֳ�ʱʱ�䣨���룬Ĭ�ϣ�5000�� */

procedure HP_UdpArqServer_SetHandShakeTimeout(pServer: HP_UdpArqServer; dwHandShakeTimeout: DWORD); stdcall; external HPSocketDLL;

// * ����Ƿ��� nodelay ģʽ */
function HP_UdpArqServer_IsNoDelay(pServer: HP_UdpArqServer): Boolean; stdcall; external HPSocketDLL;
// * ����Ƿ�ر�ӵ������ */

function HP_UdpArqServer_IsTurnoffCongestCtrl(pServer: HP_UdpArqServer): Boolean; stdcall; external HPSocketDLL;
// * ��ȡ����ˢ�¼�� */

function HP_UdpArqServer_GetFlushInterval(pServer: HP_UdpArqServer): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�����ش� ACK ��Խ���� */

function HP_UdpArqServer_GetResendByAcks(pServer: HP_UdpArqServer): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ���ʹ��ڴ�С */

function HP_UdpArqServer_GetSendWndSize(pServer: HP_UdpArqServer): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ���մ��ڴ�С */

function HP_UdpArqServer_GetRecvWndSize(pServer: HP_UdpArqServer): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ��С�ش���ʱʱ�� */

function HP_UdpArqServer_GetMinRto(pServer: HP_UdpArqServer): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ����䵥Ԫ */

function HP_UdpArqServer_GetMaxTransUnit(pServer: HP_UdpArqServer): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ������ݰ���С */

function HP_UdpArqServer_GetMaxMessageSize(pServer: HP_UdpArqServer): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ���ֳ�ʱʱ�� */

function HP_UdpArqServer_GetHandShakeTimeout(pServer: HP_UdpArqServer): DWORD; stdcall; external HPSocketDLL;

// * ��ȡ�ȴ����Ͱ����� */
function HP_UdpArqServer_GetWaitingSendMessageCount(pServer: HP_UdpArqServer; dwConnID: HP_CONNID; var piCount: Integer): Boolean; stdcall; external HPSocketDLL;

// **************************************************************************/
// ***************************** Agent �������� *****************************/

// *
{ * ���ƣ�����ͨ�����
  * ����������ͨ�Ŵ��������������ɺ�ɿ�ʼ����Զ�̷�����
  *
  * ������		lpszBindAddress	-- �󶨵�ַ��Ĭ�ϣ�nullptr���� 0.0.0.0��
  *			bAsyncConnect	-- �Ƿ�����첽 Connect
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� HP_Agent_GetLastError() ��ȡ�������
  */ }
function HP_Agent_Start(pAgent: HP_Agent; lpszBindAddress: PChar; bAsyncConnect: BOOL): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ��ر�ͨ�����
  * �������ر�ͨ��������ر���ɺ�Ͽ��������Ӳ��ͷ�������Դ
  *
  * ������
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� HP_Agent_GetLastError() ��ȡ�������
  */ }
function HP_Agent_Stop(pAgent: HP_Agent): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ����ӷ�����
  * ���������ӷ����������ӳɹ��� IAgentListener ����յ� OnConnect() / OnHandShake() �¼�
  *
  * ������		lpszRemoteAddress	-- ����˵�ַ
  *			usPort				-- ����˶˿�
  *			pdwConnID			-- ���� ID��Ĭ�ϣ�nullptr������ȡ���� ID��
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ������ SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_Agent_Connect(pAgent: HP_Agent; lpszRemoteAddress: PChar; usPort: USHORT; pdwConnID: PInteger): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ����ӷ�����
  * ���������ӷ����������ӳɹ��� IAgentListener ����յ� OnConnect() / OnHandShake() �¼�
  *
  * ������		lpszRemoteAddress	-- ����˵�ַ
  *			usPort				-- ����˶˿�
  *			pdwConnID			-- ���� ID��Ĭ�ϣ�nullptr������ȡ���� ID��
  *			pExtra				-- ���Ӹ������ݣ�Ĭ�ϣ�nullptr��
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ������ SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_Agent_ConnectWithExtra(pAgent: HP_Agent; lpszRemoteAddress: PChar; usPort: USHORT;var pdwConnID: PInteger; pExtra: PVOID): BOOL; stdcall; external HPSocketDLL;

{ /*
  * ���ƣ����ӷ�����
  * ���������ӷ����������ӳɹ��� IAgentListener ����յ� OnConnect() / OnHandShake() �¼�
  *
  * ������		lpszRemoteAddress	-- ����˵�ַ
  *			usPort				-- ����˶˿�
  *			pdwConnID			-- ���� ID��Ĭ�ϣ�nullptr������ȡ���� ID��
  *			usLocalPort			-- ���ض˿ڣ�Ĭ�ϣ�0��
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ������ SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_Agent_ConnectWithLocalPort(pAgent: HP_Agent; lpszRemoteAddress: PChar; usPort: USHORT; pdwConnID: PInteger; usLocalPort: USHORT): BOOL; stdcall; external HPSocketDLL;
{/*
* ���ƣ����ӷ�����
* ���������ӷ����������ӳɹ��� IAgentListener ����յ� OnConnect() / OnHandShake() �¼�
*
* ������		lpszRemoteAddress	-- ����˵�ַ
*			usPort				-- ����˶˿�
*			pdwConnID			-- ���� ID��Ĭ�ϣ�nullptr������ȡ���� ID��
*			lpszLocalAddress	-- ���ص�ַ��Ĭ�ϣ�nullptr��ʹ�� Start() �����а󶨵ĵ�ַ��
* ����ֵ��	TRUE	-- �ɹ�
*			FALSE	-- ʧ�ܣ���ͨ������ SYS_GetLastError() ��ȡ Windows �������
*/ }
function HP_Agent_ConnectWithLocalAddress(pAgent: HP_Agent; lpszRemoteAddress: PChar; usPort: USHORT; pdwConnID: PInteger; lpszLocalAddress: PChar): Boolean; stdcall; external HPSocketDLL;

{ /*
  * ���ƣ����ӷ�����
  * ���������ӷ����������ӳɹ��� IAgentListener ����յ� OnConnect() / OnHandShake() �¼�
  *
  * ������		lpszRemoteAddress	-- ����˵�ַ
  *			usPort				-- ����˶˿�
  *			pdwConnID			-- ���� ID��Ĭ�ϣ�nullptr������ȡ���� ID��
  *			pExtra				-- ���Ӹ������ݣ�Ĭ�ϣ�nullptr��
  *			usLocalPort			-- ���ض˿ڣ�Ĭ�ϣ�0��
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ������ SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_Agent_ConnectWithExtraAndLocalPort(pAgent: HP_Agent; lpszRemoteAddress: PChar; usPort: USHORT; pdwConnID: PInteger; pExtra: PVOID; usLocalPort: USHORT): BOOL; stdcall; external HPSocketDLL;
{/*
* ���ƣ����ӷ�����
* ���������ӷ����������ӳɹ��� IAgentListener ����յ� OnConnect() / OnHandShake() �¼�
*
* ������		lpszRemoteAddress	-- ����˵�ַ
*			usPort				-- ����˶˿�
*			pdwConnID			-- ���� ID��Ĭ�ϣ�nullptr������ȡ���� ID��
*			pExtra				-- ���Ӹ������ݣ�Ĭ�ϣ�nullptr��
*			usLocalPort			-- ���ض˿ڣ�Ĭ�ϣ�0��
*			lpszLocalAddress	-- ���ص�ַ��Ĭ�ϣ�nullptr��ʹ�� Start() �����а󶨵ĵ�ַ��
* ����ֵ��	TRUE	-- �ɹ�
*			FALSE	-- ʧ�ܣ���ͨ������ SYS_GetLastError() ��ȡ Windows �������
*/}
function HP_Agent_ConnectWithExtraAndLocalAddressPort(pAgent:HP_Agent ; lpszRemoteAddress: PChar; usPort: USHORT ; pdwConnID: PInteger;pExtra: PVOID ;usLocalPort: USHORT ; lpszLocalAddress: PChar ): Boolean ; stdcall; external HPSocketDLL;
{ //*
  * ���ƣ���������
  * ��������ָ�����ӷ�������
  *
  * ������		dwConnID	-- ���� ID
  *			pBuffer		-- ���ͻ�����
  *			iLength		-- ���ͻ���������
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_Agent_Send(pAgent: HP_Agent; dwConnID: HP_CONNID; const pBuffer: PBYTE; iLength: Integer): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ���������
  * ��������ָ�����ӷ�������
  *
  * ������		dwConnID	-- ���� ID
  *			pBuffer		-- ���ͻ�����
  *			iLength		-- ���ͻ���������
  *			iOffset		-- ���ͻ�����ָ��ƫ����
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_Agent_SendPart(pAgent: HP_Agent; dwConnID: HP_CONNID; const pBuffer: PBYTE; iLength: Integer; iOffset: Integer): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ����Ͷ�������
  * ��������ָ�����ӷ��Ͷ�������
  *		TCP - ˳�����������ݰ�
  *		UDP - ���������ݰ���ϳ�һ�����ݰ����ͣ����ݰ����ܳ��Ȳ��ܴ������õ� UDP ����󳤶ȣ�
  *
  * ������		dwConnID	-- ���� ID
  *			pBuffers	-- ���ͻ���������
  *			iCount		-- ���ͻ�������Ŀ
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_Agent_SendPackets(pAgent: HP_Agent; dwConnID: HP_CONNID; const pBuffers: WSABUFArray; iCount: Integer): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ���ͣ/�ָ�����
  * ��������ͣ/�ָ�ĳ�����ӵ����ݽ��չ���
  *
  * ������		dwConnID	-- ���� ID
  *			bPause		-- TRUE - ��ͣ, FALSE - �ָ�
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ��
  */ }
function HP_Agent_PauseReceive(pAgent: HP_Agent; dwConnID: HP_CONNID; bPause: BOOL): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ��Ͽ�����
  * �������Ͽ�ĳ������
  *
  * ������		dwConnID	-- ���� ID
  *			bForce		-- �Ƿ�ǿ�ƶϿ�����
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ��
  */ }
function HP_Agent_Disconnect(pAgent: HP_Agent; dwConnID: HP_CONNID; bForce: BOOL): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ��Ͽ���ʱ����
  * �������Ͽ�����ָ��ʱ��������
  *
  * ������		dwPeriod	-- ʱ�������룩
  *			bForce		-- �Ƿ�ǿ�ƶϿ�����
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ��
  */ }
function HP_Agent_DisconnectLongConnections(pAgent: HP_Agent; dwPeriod: DWORD; bForce: BOOL): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ��Ͽ���Ĭ����
  * �������Ͽ�����ָ��ʱ���ľ�Ĭ����
  *
  * ������		dwPeriod	-- ʱ�������룩
  *			bForce		-- �Ƿ�ǿ�ƶϿ�����
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ��
  */ }
function HP_Agent_DisconnectSilenceConnections(pAgent: HP_Agent; dwPeriod: DWORD; bForce: BOOL): BOOL; stdcall; external HPSocketDLL;

// ******************************************************************************/
// ***************************** Agent ���Է��ʷ��� *****************************/

{ //*
  * ���ƣ��������ӵĸ�������
  * �������Ƿ�Ϊ���Ӱ󶨸������ݻ��߰�ʲô�������ݣ�����Ӧ�ó���ֻ������
  *
  * ������		dwConnID	-- ���� ID
  *			pv			-- ����
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���Ч������ ID��
  */ }
function HP_Agent_SetConnectionExtra(pAgent: HP_Agent; dwConnID: HP_CONNID; pExtra: Pointer): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ���ȡ���ӵĸ�������
  * �������Ƿ�Ϊ���Ӱ󶨸������ݻ��߰�ʲô�������ݣ�����Ӧ�ó���ֻ������
  *
  * ������		dwConnID	-- ���� ID
  *			ppv			-- ����ָ��
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���Ч������ ID��
  */ }
function HP_Agent_GetConnectionExtra(pAgent: HP_Agent; dwConnID: HP_CONNID; var ppExtra: PVOID): BOOL; stdcall; external HPSocketDLL;

// * ����Ƿ�Ϊ��ȫ���ӣ�SSL/HTTPS�� */
function HP_Agent_IsSecure(pAgent: HP_Agent): BOOL; stdcall; external HPSocketDLL;

// * ���ͨ������Ƿ������� */
function HP_Agent_HasStarted(pAgent: HP_Agent): BOOL; stdcall; external HPSocketDLL;
// * �鿴ͨ�������ǰ״̬ */

function HP_Agent_GetState(pAgent: HP_Agent): En_HP_ServiceState; stdcall; external HPSocketDLL;
// * ��ȡ������ */

function HP_Agent_GetConnectionCount(pAgent: HP_Agent): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�������ӵ� HP_CONNID */

function HP_Agent_GetAllConnectionIDs(pAgent: HP_Agent; pIDs: HP_CONNIDArray; var pdwCount: DWORD): BOOL; stdcall; external HPSocketDLL;
// * ��ȡĳ������ʱ�������룩 */

function HP_Agent_GetConnectPeriod(pAgent: HP_Agent; dwConnID: HP_CONNID; var pdwPeriod: DWORD): BOOL; stdcall; external HPSocketDLL;
// * ��ȡĳ�����Ӿ�Ĭʱ�䣨���룩 */

function HP_Agent_GetSilencePeriod(pAgent: HP_Agent; dwConnID: HP_CONNID; var pdwPeriod: DWORD): BOOL; stdcall; external HPSocketDLL;
// * ��ȡĳ�����ӵı��ص�ַ��Ϣ */

function HP_Agent_GetLocalAddress(pAgent: HP_Agent; dwConnID: HP_CONNID; lpszAddress: PChar; var piAddressLen: Integer; var pusPort: USHORT): BOOL; stdcall; external HPSocketDLL;
// * ��ȡĳ�����ӵ�Զ�̵�ַ��Ϣ */

function HP_Agent_GetRemoteAddress(pAgent: HP_Agent; dwConnID: HP_CONNID; lpszAddress: PChar; var piAddressLen: Integer; var pusPort: USHORT): BOOL; stdcall; external HPSocketDLL;
// * ��ȡĳ�����ӵ�Զ��������Ϣ */

function HP_Agent_GetRemoteHost(pAgent: HP_Agent; dwConnID: HP_CONNID; lpszHost: PChar; var piHostLen: Integer; var Integer: USHORT): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ���һ��ʧ�ܲ����Ĵ������ */

function HP_Agent_GetLastError(pAgent: HP_Agent): En_HP_SocketError; stdcall; external HPSocketDLL;
// * ��ȡ���һ��ʧ�ܲ����Ĵ������� */

function HP_Agent_GetLastErrorDesc(pAgent: HP_Agent): PChar; stdcall; external HPSocketDLL;
// * ��ȡ������δ�������ݵĳ��� */

function HP_Agent_GetPendingDataLength(pAgent: HP_Agent; dwConnID: HP_CONNID; var piPending: Integer): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ���ӵ����ݽ���״̬ */

function HP_Agent_IsPauseReceive(pAgent: HP_Agent; dwConnID: HP_CONNID; var pbPaused: BOOL): BOOL; stdcall; external HPSocketDLL;
// * ����Ƿ���Ч���� */

function HP_Agent_IsConnected(pAgent: HP_Agent; dwConnID: HP_CONNID): BOOL; stdcall; external HPSocketDLL;

// * �������ݷ��Ͳ��� */
procedure HP_Agent_SetSendPolicy(pAgent: HP_Agent; enSendPolicy: En_HP_SendPolicy); stdcall; external HPSocketDLL;
// * ���� OnSend �¼�ͬ�����ԣ�Ĭ�ϣ�OSSP_NONE����ͬ���� */

procedure HP_Agent_SetOnSendSyncPolicy(pAgent: HP_Agent; enSyncPolicy: En_HP_OnSendSyncPolicy); stdcall; external HPSocketDLL;
// * ���� Socket �����������ʱ�䣨���룬�������ڼ�� Socket ��������ܱ���ȡʹ�ã� */

procedure HP_Agent_SetFreeSocketObjLockTime(pAgent: HP_Agent; dwFreeSocketObjLockTime: DWORD); stdcall; external HPSocketDLL;
// * ���� Socket ����ش�С��ͨ������Ϊƽ���������������� 1/3 - 1/2�� */

procedure HP_Agent_SetFreeSocketObjPool(pAgent: HP_Agent; dwFreeSocketObjPool: DWORD); stdcall; external HPSocketDLL;
// * �����ڴ�黺��ش�С��ͨ������Ϊ Socket ����ش�С�� 2 - 3 ���� */

procedure HP_Agent_SetFreeBufferObjPool(pAgent: HP_Agent; dwFreeBufferObjPool: DWORD); stdcall; external HPSocketDLL;
// * ���� Socket ����ػ��շ�ֵ��ͨ������Ϊ Socket ����ش�С�� 3 ���� */

procedure HP_Agent_SetFreeSocketObjHold(pAgent: HP_Agent; dwFreeSocketObjHold: DWORD); stdcall; external HPSocketDLL;
// * �����ڴ�黺��ػ��շ�ֵ��ͨ������Ϊ�ڴ�黺��ش�С�� 3 ���� */

procedure HP_Agent_SetFreeBufferObjHold(pAgent: HP_Agent; dwFreeBufferObjHold: DWORD); stdcall; external HPSocketDLL;
// * ���������������������������ֵԤ�����ڴ棬�����Ҫ����ʵ��������ã����˹���*/

procedure HP_Agent_SetMaxConnectionCount(pAgent: HP_Agent; dwMaxConnectionCount: DWORD); stdcall; external HPSocketDLL;
// * ���ù����߳�������ͨ������Ϊ 2 * CPU + 2�� */

procedure HP_Agent_SetWorkerThreadCount(pAgent: HP_Agent; dwWorkerThreadCount: DWORD); stdcall; external HPSocketDLL;
// * �����Ƿ��Ǿ�Ĭʱ�䣨����Ϊ TRUE ʱ DisconnectSilenceConnections() �� GetSilencePeriod() ����Ч��Ĭ�ϣ�TRUE�� */

procedure HP_Agent_SetMarkSilence(pAgent: HP_Agent; bMarkSilence: BOOL); stdcall; external HPSocketDLL;

// * ��ȡ���ݷ��Ͳ��� */
function HP_Agent_GetSendPolicy(pAgent: HP_Agent): En_HP_SendPolicy; stdcall; external HPSocketDLL;
// * ��ȡ OnSend �¼�ͬ������ */

function HP_Agent_GetOnSendSyncPolicy(pAgent: HP_Agent): En_HP_OnSendSyncPolicy; stdcall; external HPSocketDLL;
// * ��ȡ Socket �����������ʱ�� */

function HP_Agent_GetFreeSocketObjLockTime(pAgent: HP_Agent): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ Socket ����ش�С */

function HP_Agent_GetFreeSocketObjPool(pAgent: HP_Agent): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�ڴ�黺��ش�С */

function HP_Agent_GetFreeBufferObjPool(pAgent: HP_Agent): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ Socket ����ػ��շ�ֵ */

function HP_Agent_GetFreeSocketObjHold(pAgent: HP_Agent): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�ڴ�黺��ػ��շ�ֵ */

function HP_Agent_GetFreeBufferObjHold(pAgent: HP_Agent): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ��������� */

function HP_Agent_GetMaxConnectionCount(pAgent: HP_Agent): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�����߳����� */

function HP_Agent_GetWorkerThreadCount(pAgent: HP_Agent): DWORD; stdcall; external HPSocketDLL;
// * ����Ƿ��Ǿ�Ĭʱ�� */

function HP_Agent_IsMarkSilence(pAgent: HP_Agent): BOOL; stdcall; external HPSocketDLL;

// **********************************************************************************/
// ******************************* TCP Agent �������� *******************************/

// *
{ * ���ƣ�����С�ļ�
  * ��������ָ�����ӷ��� 4096 KB ���µ�С�ļ�
  *
  * ������		dwConnID		-- ���� ID
  *			lpszFileName	-- �ļ�·��
  *			pHead			-- ͷ����������
  *			pTail			-- β����������
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_TcpAgent_SendSmallFile(pAgent: HP_Agent; dwConnID: HP_CONNID; lpszFileName: PChar; const pHead: LPWSABUF; const pTail: LPWSABUF): BOOL; stdcall; external HPSocketDLL;

// **********************************************************************************/
// ***************************** TCP Agent ���Է��ʷ��� *****************************/

// * �����Ƿ����õ�ַ���û��ƣ�Ĭ�ϣ������ã� */
procedure HP_TcpAgent_SetReuseAddress(pAgent: HP_TcpAgent; bReuseAddress: BOOL); stdcall; external HPSocketDLL;
// * ����Ƿ����õ�ַ���û��� */

function HP_TcpAgent_IsReuseAddress(pAgent: HP_TcpAgent): BOOL; stdcall; external HPSocketDLL;
// * ����ͨ�����ݻ�������С������ƽ��ͨ�����ݰ���С�������ã�ͨ������Ϊ 1024 �ı����� */

procedure HP_TcpAgent_SetSocketBufferSize(pAgent: HP_TcpAgent; dwSocketBufferSize: DWORD); stdcall; external HPSocketDLL;
// * ����������������������룬0 �򲻷�����������Ĭ�ϣ�30 * 1000�� */

procedure HP_TcpAgent_SetKeepAliveTime(pAgent: HP_TcpAgent; dwKeepAliveTime: DWORD); stdcall; external HPSocketDLL;
// * �����쳣��������������룬0 ����������������Ĭ�ϣ�10 * 1000������������ɴ� [Ĭ�ϣ�WinXP 5 ��, Win7 10 ��] ��ⲻ������ȷ�ϰ�����Ϊ�Ѷ��ߣ� */

procedure HP_TcpAgent_SetKeepAliveInterval(pAgent: HP_TcpAgent; dwKeepAliveInterval: DWORD); stdcall; external HPSocketDLL;
// * ��ȡͨ�����ݻ�������С */

function HP_TcpAgent_GetSocketBufferSize(pAgent: HP_TcpAgent): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ������������� */

function HP_TcpAgent_GetKeepAliveTime(pAgent: HP_TcpAgent): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�쳣��������� */

function HP_TcpAgent_GetKeepAliveInterval(pAgent: HP_TcpAgent): DWORD; stdcall; external HPSocketDLL;

// ******************************************************************************/
// ***************************** Client ����������� *****************************/

// *
{ * ���ƣ�����ͨ�����
  * �����������ͻ���ͨ����������ӷ���ˣ�������ɺ�ɿ�ʼ�շ�����
  *
  * ������		lpszRemoteAddress	-- ����˵�ַ
  *			usPort				-- ����˶˿�
  *			bAsyncConnect		-- �Ƿ�����첽 Connect
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� HP_Client_GetLastError() ��ȡ�������
  */ }
function HP_Client_Start(pClient: HP_Client; lpszRemoteAddress: PChar; usPort: USHORT; bAsyncConnect: BOOL): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ�����ͨ���������ָ���󶨵�ַ��
  * �����������ͻ���ͨ����������ӷ���ˣ�������ɺ�ɿ�ʼ�շ�����
  *
  * ������		lpszRemoteAddress	-- ����˵�ַ
  *			usPort				-- ����˶˿�
  *			bAsyncConnect		-- �Ƿ�����첽 Connect
  *			lpszBindAddress		-- �󶨵�ַ��Ĭ�ϣ�nullptr��TcpClient/UdpClient -> ��ִ�а󶨲�����UdpCast �� -> 0.0.0.0��
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� HP_Client_GetLastError() ��ȡ�������
  */ }
function HP_Client_StartWithBindAddress(pClient: HP_Client; lpszRemoteAddress: PChar; usPort: USHORT; bAsyncConnect: BOOL; lpszBindAddress: PChar): BOOL; stdcall; external HPSocketDLL;

{ /*
  * ���ƣ�����ͨ���������ָ���󶨵�ַ��
  * �����������ͻ���ͨ����������ӷ���ˣ�������ɺ�ɿ�ʼ�շ�����
  *
  * ������		lpszRemoteAddress	-- ����˵�ַ
  *			usPort				-- ����˶˿�
  *			bAsyncConnect		-- �Ƿ�����첽 Connect
  *			lpszBindAddress		-- �󶨵�ַ��Ĭ�ϣ�nullptr��TcpClient/UdpClient -> ��ִ�а󶨲�����UdpCast �� -> �����ַ��
  *			usLocalPort			-- ���ض˿ڣ�Ĭ�ϣ�0��
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� HP_Client_GetLastError() ��ȡ�������
  */ }
function HP_Client_StartWithBindAddressAndLocalPort(pClient: HP_Client; lpszRemoteAddress: PChar; usPort: USHORT; bAsyncConnect: BOOL; lpszBindAddress: PChar; usLocalPort: USHORT): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ��ر�ͨ�����
  * �������رտͻ���ͨ��������ر���ɺ�Ͽ������˵����Ӳ��ͷ�������Դ
  *
  * ������
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� HP_Client_GetLastError() ��ȡ�������
  */ }
function HP_Client_Stop(pClient: HP_Client): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ���������
  * �����������˷�������
  *
  * ������		pBuffer		-- ���ͻ�����
  *			iLength		-- ���ͻ���������
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_Client_Send(pClient: HP_Client; const pBuffer: PBYTE; iLength: Integer): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ���������
  * �����������˷�������
  *
  * ������		pBuffer		-- ���ͻ�����
  *			iLength		-- ���ͻ���������
  *			iOffset		-- ���ͻ�����ָ��ƫ����
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_Client_SendPart(pClient: HP_Client; const pBuffer: PBYTE; iLength: Integer; iOffset: Integer): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ����Ͷ�������
  * �����������˷��Ͷ�������
  *		TCP - ˳�����������ݰ�
  *		UDP - ���������ݰ���ϳ�һ�����ݰ����ͣ����ݰ����ܳ��Ȳ��ܴ������õ� UDP ����󳤶ȣ�
  *
  * ������		pBuffers	-- ���ͻ���������
  *			iCount		-- ���ͻ�������Ŀ
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_Client_SendPackets(pClient: HP_Client; const pBuffers: WSABUFArray; iCount: Integer): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ���ͣ/�ָ�����
  * ��������ͣ/�ָ�ĳ�����ӵ����ݽ��չ���
  *
  *			bPause	-- TRUE - ��ͣ, FALSE - �ָ�
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ��
  */ }
function HP_Client_PauseReceive(pClient: HP_Client; bPause: BOOL): BOOL; stdcall; external HPSocketDLL;

// ******************************************************************************/
// ***************************** Client ���Է��ʷ��� *****************************/

// * �������ӵĸ������� */
procedure HP_Client_SetExtra(pClient: HP_Client; pExtra: PVOID); stdcall; external HPSocketDLL;
// * ��ȡ���ӵĸ������� */

function HP_Client_GetExtra(pClient: HP_Client): PVOID; stdcall; external HPSocketDLL;

// * ����Ƿ�Ϊ��ȫ���ӣ�SSL/HTTPS�� */
function HP_Client_IsSecure(pClient: HP_Client): BOOL; stdcall; external HPSocketDLL;

// * ���ͨ������Ƿ������� */
function HP_Client_HasStarted(pClient: HP_Client): BOOL; stdcall; external HPSocketDLL;
// * �鿴ͨ�������ǰ״̬ */

function HP_Client_GetState(pClient: HP_Client): En_HP_ServiceState; stdcall; external HPSocketDLL;
// * ��ȡ���һ��ʧ�ܲ����Ĵ������ */

function HP_Client_GetLastError(pClient: HP_Client): En_HP_SocketError; stdcall; external HPSocketDLL;
// * ��ȡ���һ��ʧ�ܲ����Ĵ������� */

function HP_Client_GetLastErrorDesc(pClient: HP_Client): PChar; stdcall; external HPSocketDLL;
// * ��ȡ�������������� ID */

function HP_Client_GetConnectionID(pClient: HP_Client): HP_CONNID; stdcall; external HPSocketDLL;
// * ��ȡ Client Socket �ĵ�ַ��Ϣ */

function HP_Client_GetLocalAddress(pClient: HP_Client; lpszAddress: PChar; var piAddressLen: Integer; var pusPort: USHORT): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ���ӵ�Զ��������Ϣ */

function HP_Client_GetRemoteHost(pClient: HP_Client; lpszHost: PChar; var piHostLen: Integer; var pusPort: USHORT): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ������δ�������ݵĳ��� */

function HP_Client_GetPendingDataLength(pClient: HP_Client; var piPending: Integer): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ���ӵ����ݽ���״̬ */

function HP_Client_IsPauseReceive(pClient: HP_Client; var pbPaused: BOOL): BOOL; stdcall; external HPSocketDLL;
// * ����Ƿ���Ч���� */

function HP_Client_IsConnected(pClient: HP_Client): BOOL; stdcall; external HPSocketDLL;
// * �����ڴ�黺��ش�С��ͨ������Ϊ -> PUSH ģ�ͣ�5 - 10��PULL ģ�ͣ�10 - 20 �� */

procedure HP_Client_SetFreeBufferPoolSize(pClient: HP_Client; dwFreeBufferPoolSize: DWORD); stdcall; external HPSocketDLL;
// * �����ڴ�黺��ػ��շ�ֵ��ͨ������Ϊ�ڴ�黺��ش�С�� 3 ���� */

procedure HP_Client_SetFreeBufferPoolHold(pClient: HP_Client; dwFreeBufferPoolHold: DWORD); stdcall; external HPSocketDLL;
// * ��ȡ�ڴ�黺��ش�С */

function HP_Client_GetFreeBufferPoolSize(pClient: HP_Client): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�ڴ�黺��ػ��շ�ֵ */

function HP_Client_GetFreeBufferPoolHold(pClient: HP_Client): DWORD; stdcall; external HPSocketDLL;

// **********************************************************************************/
// ******************************* TCP Client �������� *******************************/

// *
{ * ���ƣ�����С�ļ�
  * �����������˷��� 4096 KB ���µ�С�ļ�
  *
  * ������		lpszFileName	-- �ļ�·��
  *			pHead			-- ͷ����������
  *			pTail			-- β����������
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡ Windows �������
  */ }
function HP_TcpClient_SendSmallFile(pClient: HP_Client; lpszFileName: PChar; const pHead: LPWSABUF; const pTail: LPWSABUF): BOOL; stdcall; external HPSocketDLL;

// **********************************************************************************/
// ***************************** TCP Client ���Է��ʷ��� *****************************/

// * ����ͨ�����ݻ�������С������ƽ��ͨ�����ݰ���С�������ã�ͨ������Ϊ��(N * 1024) - sizeof(TBufferObj)�� */
procedure HP_TcpClient_SetSocketBufferSize(pClient: HP_TcpClient; dwSocketBufferSize: DWORD); stdcall; external HPSocketDLL;
// * ����������������������룬0 �򲻷�����������Ĭ�ϣ�30 * 1000�� */

procedure HP_TcpClient_SetKeepAliveTime(pClient: HP_TcpClient; dwKeepAliveTime: DWORD); stdcall; external HPSocketDLL;
// * �����쳣��������������룬0 ����������������Ĭ�ϣ�10 * 1000������������ɴ� [Ĭ�ϣ�WinXP 5 ��, Win7 10 ��] ��ⲻ������ȷ�ϰ�����Ϊ�Ѷ��ߣ� */

procedure HP_TcpClient_SetKeepAliveInterval(pClient: HP_TcpClient; dwKeepAliveInterval: DWORD); stdcall; external HPSocketDLL;

// * ��ȡͨ�����ݻ�������С */
function HP_TcpClient_GetSocketBufferSize(pClient: HP_TcpClient): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ������������� */

function HP_TcpClient_GetKeepAliveTime(pClient: HP_TcpClient): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�쳣��������� */

function HP_TcpClient_GetKeepAliveInterval(pClient: HP_TcpClient): DWORD; stdcall; external HPSocketDLL;

// **********************************************************************************/
// ***************************** UDP Client ���Է��ʷ��� *****************************/

// * �������ݱ�����󳤶ȣ������ھ����������²����� 1472 �ֽڣ��ڹ����������²����� 548 �ֽڣ� */
procedure HP_UdpClient_SetMaxDatagramSize(pClient: HP_UdpClient; dwMaxDatagramSize: DWORD); stdcall; external HPSocketDLL;
// * ��ȡ���ݱ�����󳤶� */

function HP_UdpClient_GetMaxDatagramSize(pClient: HP_UdpClient): DWORD; stdcall; external HPSocketDLL;
// * ���ü������Դ�����0 �򲻷��ͼ�������������������Դ�������Ϊ�Ѷ��ߣ� */

procedure HP_UdpClient_SetDetectAttempts(pClient: HP_UdpClient; dwDetectAttempts: DWORD); stdcall; external HPSocketDLL;
// * ���ü������ͼ�����룬0 �����ͼ����� */

procedure HP_UdpClient_SetDetectInterval(pClient: HP_UdpClient; dwDetectInterval: DWORD); stdcall; external HPSocketDLL;
// * ��ȡ���������� */

function HP_UdpClient_GetDetectAttempts(pClient: HP_UdpClient): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ��������� */

function HP_UdpClient_GetDetectInterval(pClient: HP_UdpClient): DWORD; stdcall; external HPSocketDLL;

// **********************************************************************************/
// *************************** UDP ARQ Client ���Է��ʷ��� ***************************/

// * �����Ƿ��� nodelay ģʽ��Ĭ�ϣ�FALSE���������� */
procedure HP_UdpArqClient_SetNoDelay(pClient: HP_UdpArqClient; bNoDelay: Boolean); stdcall; external HPSocketDLL;
// * �����Ƿ�ر�ӵ�����ƣ�Ĭ�ϣ�FALSE�����رգ� */

procedure HP_UdpArqClient_SetTurnoffCongestCtrl(pClient: HP_UdpArqClient; bTurnOff: Boolean); stdcall; external HPSocketDLL;
// * ��������ˢ�¼�������룬Ĭ�ϣ�60�� */

procedure HP_UdpArqClient_SetFlushInterval(pClient: HP_UdpArqClient; dwFlushInterval: DWORD); stdcall; external HPSocketDLL;
// * ���ÿ����ش� ACK ��Խ������Ĭ�ϣ�0���رտ����ش��� */

procedure HP_UdpArqClient_SetResendByAcks(pClient: HP_UdpArqClient; dwResendByAcks: DWORD); stdcall; external HPSocketDLL;
// * ���÷��ʹ��ڴ�С�����ݰ�������Ĭ�ϣ�128�� */

procedure HP_UdpArqClient_SetSendWndSize(pClient: HP_UdpArqClient; dwSendWndSize: DWORD); stdcall; external HPSocketDLL;
// * ���ý��մ��ڴ�С�����ݰ�������Ĭ�ϣ�512�� */

procedure HP_UdpArqClient_SetRecvWndSize(pClient: HP_UdpArqClient; dwRecvWndSize: DWORD); stdcall; external HPSocketDLL;
// * ������С�ش���ʱʱ�䣨���룬Ĭ�ϣ�30�� */

procedure HP_UdpArqClient_SetMinRto(pClient: HP_UdpArqClient; dwMinRto: DWORD); stdcall; external HPSocketDLL;
// * ��������䵥Ԫ��Ĭ�ϣ�0���� SetMaxDatagramSize(pClient:) һ�£� */

procedure HP_UdpArqClient_SetMaxTransUnit(pClient: HP_UdpArqClient; dwMaxTransUnit: DWORD); stdcall; external HPSocketDLL;
// * ����������ݰ���С��Ĭ�ϣ�4096�� */

procedure HP_UdpArqClient_SetMaxMessageSize(pClient: HP_UdpArqClient; dwMaxMessageSize: DWORD); stdcall; external HPSocketDLL;
// * �������ֳ�ʱʱ�䣨���룬Ĭ�ϣ�5000�� */

procedure HP_UdpArqClient_SetHandShakeTimeout(pClient: HP_UdpArqClient; dwHandShakeTimeout: DWORD); stdcall; external HPSocketDLL;

// * ����Ƿ��� nodelay ģʽ */
function HP_UdpArqClient_IsNoDelay(pClient: HP_UdpArqClient): Boolean; stdcall; external HPSocketDLL;
// * ����Ƿ�ر�ӵ������ */

function HP_UdpArqClient_IsTurnoffCongestCtrl(pClient: HP_UdpArqClient): Boolean; stdcall; external HPSocketDLL;
// * ��ȡ����ˢ�¼�� */

function HP_UdpArqClient_GetFlushInterval(pClient: HP_UdpArqClient): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�����ش� ACK ��Խ���� */

function HP_UdpArqClient_GetResendByAcks(pClient: HP_UdpArqClient): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ���ʹ��ڴ�С */

function HP_UdpArqClient_GetSendWndSize(pClient: HP_UdpArqClient): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ���մ��ڴ�С */

function HP_UdpArqClient_GetRecvWndSize(pClient: HP_UdpArqClient): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ��С�ش���ʱʱ�� */

function HP_UdpArqClient_GetMinRto(pClient: HP_UdpArqClient): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ����䵥Ԫ */

function HP_UdpArqClient_GetMaxTransUnit(pClient: HP_UdpArqClient): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ������ݰ���С */

function HP_UdpArqClient_GetMaxMessageSize(pClient: HP_UdpArqClient): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ���ֳ�ʱʱ�� */

function HP_UdpArqClient_GetHandShakeTimeout(pClient: HP_UdpArqClient): DWORD; stdcall; external HPSocketDLL;

// * ��ȡ�ȴ����Ͱ����� */
function HP_UdpArqClient_GetWaitingSendMessageCount(pClient: HP_UdpArqClient; var piCount: Integer): Boolean; stdcall; external HPSocketDLL;

// **********************************************************************************/
// ****************************** UDP Cast ���Է��ʷ��� ******************************/

// * �������ݱ�����󳤶ȣ������ھ����������²����� 1472 �ֽڣ��ڹ����������²����� 548 �ֽڣ� */
procedure HP_UdpCast_SetMaxDatagramSize(pCast: HP_UdpCast; dwMaxDatagramSize: DWORD); stdcall; external HPSocketDLL;
// * ��ȡ���ݱ�����󳤶� */

function HP_UdpCast_GetMaxDatagramSize(pCast: HP_UdpCast): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ��ǰ���ݱ���Զ�̵�ַ��Ϣ��ͨ���� OnReceive �¼��е��ã� */

function HP_UdpCast_GetRemoteAddress(pCast: HP_UdpCast; lpszAddress: PChar; var piAddressLen: Integer; var pusPort: USHORT): BOOL; stdcall; external HPSocketDLL;
// * �����Ƿ����õ�ַ���û��ƣ�Ĭ�ϣ������ã� */

procedure HP_UdpCast_SetReuseAddress(pCast: HP_UdpCast; bReuseAddress: BOOL); stdcall; external HPSocketDLL;
// * ����Ƿ����õ�ַ���û��� */

function HP_UdpCast_IsReuseAddress(pCast: HP_UdpCast): BOOL; stdcall; external HPSocketDLL;
// * ���ô���ģʽ���鲥��㲥�� */

procedure HP_UdpCast_SetCastMode(pCast: HP_UdpCast; enCastMode: En_HP_CastMode); stdcall; external HPSocketDLL;
// * ��ȡ����ģʽ */

function HP_UdpCast_GetCastMode(pCast: HP_UdpCast): En_HP_CastMode; stdcall; external HPSocketDLL;
// * �����鲥���ĵ� TTL��0 - 255�� */

procedure HP_UdpCast_SetMultiCastTtl(pCast: HP_UdpCast; iMCTtl: Integer); stdcall; external HPSocketDLL;
// * ��ȡ�鲥���ĵ� TTL */

function HP_UdpCast_GetMultiCastTtl(pCast: HP_UdpCast): Integer; stdcall; external HPSocketDLL;
// * �����Ƿ������鲥��·��TRUE or FALSE�� */

procedure HP_UdpCast_SetMultiCastLoop(pCast: HP_UdpCast; bMCLoop: BOOL); stdcall; external HPSocketDLL;
// * ����Ƿ������鲥��· */

function HP_UdpCast_IsMultiCastLoop(pCast: HP_UdpCast): BOOL; stdcall; external HPSocketDLL;

// ***************************************************************************************/
// ***************************** TCP Pull Server ����������� *****************************/

// *
{ * ���ƣ�ץȡ����
  * �������û�ͨ���÷����� Socket �����ץȡ����
  *
  * ������		dwConnID	-- ���� ID
  *			pData		-- ץȡ������
  *			iLength		-- ץȡ���ݳ���
  * ����ֵ��	En_HP_FetchResult
  */ }
function HP_TcpPullServer_Fetch(pServer: HP_TcpPullServer; dwConnID: HP_CONNID; pData: PBYTE; iLength: Integer): En_HP_FetchResult; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ���̽���ݣ������Ƴ����������ݣ�
  * �������û�ͨ���÷����� Socket ����п�̽����
  *
  * ������		dwConnID	-- ���� ID
  *			pData		-- ��̽������
  *			iLength		-- ��̽���ݳ���
  * ����ֵ��	En_HP_FetchResult
  */ }
function HP_TcpPullServer_Peek(pServer: HP_TcpPullServer; dwConnID: HP_CONNID; pData: PBYTE; iLength: Integer): En_HP_FetchResult; stdcall; external HPSocketDLL;

// ***************************************************************************************/
// ***************************** TCP Pull Server ���Է��ʷ��� *****************************/

// ***************************************************************************************/
// ***************************** TCP Pull Agent ����������� *****************************/

{ //*
  * ���ƣ�ץȡ����
  * �������û�ͨ���÷����� Socket �����ץȡ����
  *
  * ������		dwConnID	-- ���� ID
  *			pData		-- ץȡ������
  *			iLength		-- ץȡ���ݳ���
  * ����ֵ��	En_HP_FetchResult
  */ }
function HP_TcpPullAgent_Fetch(pAgent: HP_TcpPullAgent; dwConnID: HP_CONNID; pData: PBYTE; iLength: Integer): En_HP_FetchResult; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ���̽���ݣ������Ƴ����������ݣ�
  * �������û�ͨ���÷����� Socket ����п�̽����
  *
  * ������		dwConnID	-- ���� ID
  *			pData		-- ��̽������
  *			iLength		-- ��̽���ݳ���
  * ����ֵ��	En_HP_FetchResult
  */ }
function HP_TcpPullAgent_Peek(pAgent: HP_TcpPullAgent; dwConnID: HP_CONNID; pData: PBYTE; iLength: Integer): En_HP_FetchResult; stdcall; external HPSocketDLL;

// ***************************************************************************************/
// ***************************** TCP Pull Agent ���Է��ʷ��� *****************************/

// ***************************************************************************************/
// ***************************** TCP Pull Client ����������� *****************************/

{ //*
  * ���ƣ�ץȡ����
  * �������û�ͨ���÷����� Socket �����ץȡ����
  *
  * ������		dwConnID	-- ���� ID
  *			pData		-- ץȡ������
  *			iLength		-- ץȡ���ݳ���
  * ����ֵ��	En_HP_FetchResult
  */ }
function HP_TcpPullClient_Fetch(pClient: HP_TcpPullClient; pData: PBYTE; iLength: Integer): En_HP_FetchResult; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ���̽���ݣ������Ƴ����������ݣ�
  * �������û�ͨ���÷����� Socket ����п�̽����
  *
  * ������		dwConnID	-- ���� ID
  *			pData		-- ��̽������
  *			iLength		-- ��̽���ݳ���
  * ����ֵ��	En_HP_FetchResult
  */ }
function HP_TcpPullClient_Peek(pClient: HP_TcpPullClient; pData: PBYTE; iLength: Integer): En_HP_FetchResult; stdcall; external HPSocketDLL;

// ***************************************************************************************/
// ***************************** TCP Pull Client ���Է��ʷ��� *****************************/

// ***************************************************************************************/
// ***************************** TCP Pack Server ����������� *****************************/

// ***************************************************************************************/
// ***************************** TCP Pack Server ���Է��ʷ��� *****************************/

// * �������ݰ���󳤶ȣ���Ч���ݰ���󳤶Ȳ��ܳ��� 4194303/0x3FFFFF �ֽڣ�Ĭ�ϣ�262144/0x40000�� */
procedure HP_TcpPackServer_SetMaxPackSize(pServer: HP_TcpPackServer; dwMaxPackSize: DWORD); stdcall; external HPSocketDLL;
// * ���ð�ͷ��ʶ����Ч��ͷ��ʶȡֵ��Χ 0 ~ 1023/0x3FF������ͷ��ʶΪ 0 ʱ��У���ͷ��Ĭ�ϣ�0�� */

procedure HP_TcpPackServer_SetPackHeaderFlag(pServer: HP_TcpPackServer; usPackHeaderFlag: DWORD); stdcall; external HPSocketDLL;

// * ��ȡ���ݰ���󳤶� */
function HP_TcpPackServer_GetMaxPackSize(pServer: HP_TcpPackServer): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ��ͷ��ʶ */

function HP_TcpPackServer_GetPackHeaderFlag(pServer: HP_TcpPackServer): DWORD; stdcall; external HPSocketDLL;

// ***************************************************************************************/
// ***************************** TCP Pack Agent ����������� *****************************/

// ***************************************************************************************/
// ***************************** TCP Pack Agent ���Է��ʷ��� *****************************/

// * �������ݰ���󳤶ȣ���Ч���ݰ���󳤶Ȳ��ܳ��� 4194303/0x3FFFFF �ֽڣ�Ĭ�ϣ�262144/0x40000�� */
procedure HP_TcpPackAgent_SetMaxPackSize(pAgent: HP_TcpPackAgent; dwMaxPackSize: DWORD); stdcall; external HPSocketDLL;
// * ���ð�ͷ��ʶ����Ч��ͷ��ʶȡֵ��Χ 0 ~ 1023/0x3FF������ͷ��ʶΪ 0 ʱ��У���ͷ��Ĭ�ϣ�0�� */

procedure HP_TcpPackAgent_SetPackHeaderFlag(pAgent: HP_TcpPackAgent; usPackHeaderFlag: DWORD); stdcall; external HPSocketDLL;

// * ��ȡ���ݰ���󳤶� */
function HP_TcpPackAgent_GetMaxPackSize(pAgent: HP_TcpPackAgent): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ��ͷ��ʶ */

function HP_TcpPackAgent_GetPackHeaderFlag(pAgent: HP_TcpPackAgent): DWORD; stdcall; external HPSocketDLL;

// ***************************************************************************************/
// ***************************** TCP Pack Client ����������� *****************************/

// ***************************************************************************************/
// ***************************** TCP Pack Client ���Է��ʷ��� *****************************/

// * �������ݰ���󳤶ȣ���Ч���ݰ���󳤶Ȳ��ܳ��� 4194303/0x3FFFFF �ֽڣ�Ĭ�ϣ�262144/0x40000�� */
procedure HP_TcpPackClient_SetMaxPackSize(pClient: HP_TcpPackClient; dwMaxPackSize: DWORD); stdcall; external HPSocketDLL;
// * ���ð�ͷ��ʶ����Ч��ͷ��ʶȡֵ��Χ 0 ~ 1023/0x3FF������ͷ��ʶΪ 0 ʱ��У���ͷ��Ĭ�ϣ�0�� */

procedure HP_TcpPackClient_SetPackHeaderFlag(pClient: HP_TcpPackClient; usPackHeaderFlag: DWORD); stdcall; external HPSocketDLL;

// * ��ȡ���ݰ���󳤶� */
function HP_TcpPackClient_GetMaxPackSize(pClient: HP_TcpPackClient): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ��ͷ��ʶ */

function HP_TcpPackClient_GetPackHeaderFlag(pClient: HP_TcpPackClient): DWORD; stdcall; external HPSocketDLL;

// *************************************************************************/
// *************** Global Function Exports *********************************/
// *************************************************************************/
// ��ȡ HPSocket �汾�ţ�4 ���ֽڷֱ�Ϊ�����汾�ţ��Ӱ汾�ţ������汾�ţ�������ţ�
function HP_GetHPSocketVersion(): LongWord; stdcall; external HPSocketDLL;

// * ��ȡ���������ı� */
function HP_GetSocketErrorDesc(enCode: En_HP_SocketError): PChar; stdcall; external HPSocketDLL;
// * ����ϵͳ�� GetLastError() ������ȡϵͳ������� */

function SYS_GetLastError(): DWORD; stdcall; external HPSocketDLL;
// ����ϵͳ�� WSAGetLastError() ������ȡϵͳ�������

function SYS_WSAGetLastError(): Integer; stdcall; external HPSocketDLL;
// ����ϵͳ�� setsockopt()

function SYS_SetSocketOption(sock: SOCKET; level: Integer; name: Integer; val: Pointer; len: Integer): Integer; stdcall; external HPSocketDLL;
// ����ϵͳ�� getsockopt()

function SYS_GetSocketOption(sock: SOCKET; level: Integer; name: Integer; val: Pointer; var len: Pointer): Integer; stdcall; external HPSocketDLL;
// ����ϵͳ�� ioctlsocket()

function SYS_IoctlSocket(sock: SOCKET; cmd: Longint; var arg: LongWord): Integer; stdcall; external HPSocketDLL;
// ����ϵͳ�� WSAIoctl()

function SYS_WSAIoctl(sock: SOCKET; dwIoControlCode: DWORD; lpvInBuffer: Pointer; cbInBuffer: DWORD; lpvOutBuffer: Pointer; cbOutBuffer: DWORD; lpcbBytesReturned: LPDWORD): Integer; stdcall; external HPSocketDLL;

// ���� socket ѡ�IPPROTO_TCP -> TCP_NODELAY
function SYS_SSO_NoDelay(sock: SOCKET; bNoDelay: BOOL): Integer; stdcall; external HPSocketDLL;
// ���� socket ѡ�SOL_SOCKET -> SO_DONTLINGER

function SYS_SSO_DontLinger(sock: SOCKET; bDont: BOOL): Integer; stdcall; external HPSocketDLL;
// ���� socket ѡ�SOL_SOCKET -> SO_LINGER

function SYS_SSO_Linger(sock: SOCKET; l_onoff: USHORT; l_linger: USHORT): Integer; stdcall; external HPSocketDLL;
// ���� socket ѡ�SOL_SOCKET -> SO_RCVBUF

function SYS_SSO_RecvBuffSize(sock: SOCKET; SIZE: Integer): Integer; stdcall; external HPSocketDLL;
// ���� socket ѡ�SOL_SOCKET -> SO_SNDBUF

function SYS_SSO_SendBuffSize(sock: SOCKET; SIZE: Integer): Integer; stdcall; external HPSocketDLL;
// ���� socket ѡ�SOL_SOCKET -> SO_REUSEADDR

function SYS_SSO_ReuseAddress(sock: SOCKET; bReuse: BOOL): Integer; stdcall; external HPSocketDLL;
// ���� socket ѡ�SOL_SOCKET -> SO_EXCLUSIVEADDRUSE

function SYS_SSO_ExclusiveAddressUse(sock: SOCKET; bExclusive: BOOL): Integer; stdcall; external HPSocketDLL;

// ��ȡ SOCKET ���ص�ַ��Ϣ
function SYS_GetSocketLocalAddress(SOCKET: SOCKET; lpszAddress: array of Char; var piAddressLen: Integer; var pusPort: USHORT): BOOL; stdcall; external HPSocketDLL;
// ��ȡ SOCKET Զ�̵�ַ��Ϣ

function SYS_GetSocketRemoteAddress(SOCKET: SOCKET; lpszAddress: array of Char; var piAddressLen: Integer; var pusPort: USHORT): BOOL; stdcall; external HPSocketDLL;

// * ö������ IP ��ַ */
function SYS_EnumHostIPAddresses(lpszHost: PChar; enType: En_HP_IPAddrType; var lpppIPAddr: HP_LPTIPAddr; var piIPAddrCount: Integer): BOOL; stdcall; external HPSocketDLL;
// * �ͷ� HP_LPTIPAddr* */

function SYS_FreeHostIPAddresses(var lppIPAddr: HP_LPTIPAddr): BOOL; stdcall; external HPSocketDLL;
// * ����ַ����Ƿ���� IP ��ַ��ʽ */

function SYS_IsIPAddress(lpszAddress: PChar; var penType: En_HP_IPAddrType): BOOL; stdcall; external HPSocketDLL;
// * ͨ����������ȡ IP ��ַ */

function SYS_GetIPAddress(lpszHost: PChar; lpszIP: array of Char; var piIPLenth: Integer; var penType: En_HP_IPAddrType): BOOL; stdcall; external HPSocketDLL;

// * 64 λ�����ֽ���ת�����ֽ��� */
function SYS_NToH64(value: LongWord): LongWord; stdcall; external HPSocketDLL;
// * 64 λ�����ֽ���ת�����ֽ��� */

function SYS_HToN64(value: LongWord): LongWord; stdcall; external HPSocketDLL;

// * �����ڴ� */
function SYS_Malloc(SIZE: Integer): PBYTE; stdcall; external HPSocketDLL;
// * ���·����ڴ� */

function SYS_Realloc(p: PBYTE; SIZE: Integer): PBYTE; stdcall; external HPSocketDLL;
// * �ͷ��ڴ� */

procedure SYS_Free(p: PBYTE); stdcall; external HPSocketDLL;

// ===================================�����Ǳ��뺯��
// CP_XXX -> UNICODE
function SYS_CodePageToUnicode(iCodePage: Integer; const szSrc: PAnsiChar; szDest: PWideChar; var piDestLength: Integer): BOOL; stdcall; external HPSocketDLL;
// UNICODE -> CP_XXX

function SYS_UnicodeToCodePage(iCodePage: Integer; const szSrc: PWideChar; szDest: PAnsiChar; var piDestLength: Integer): BOOL; stdcall; external HPSocketDLL;
// GBK -> UNICODE

function SYS_GbkToUnicode(const szSrc: PAnsiChar; szDest: PWideChar; var piDestLength: Integer): BOOL; stdcall; external HPSocketDLL;
// UNICODE -> GBK

function SYS_UnicodeToGbk(const szSrc: PWideChar; szDest: PAnsiChar; var piDestLength: Integer): BOOL; stdcall; external HPSocketDLL;
// UTF8 -> UNICODE

function SYS_Utf8ToUnicode(const szSrc: PAnsiChar; szDest: PWideChar; var piDestLength: Integer): BOOL; stdcall; external HPSocketDLL;
// UNICODE -> UTF8

function SYS_UnicodeToUtf8(const szSrc: PWideChar; szDest: PAnsiChar; var piDestLength: Integer): BOOL; stdcall; external HPSocketDLL;
// GBK -> UTF8

function SYS_GbkToUtf8(const szSrc: PAnsiChar; szDest: PAnsiChar; var piDestLength: Integer): BOOL; stdcall; external HPSocketDLL;
// UTF8 -> GBK

function SYS_Utf8ToGbk(const szSrc: PAnsiChar; szDest: PAnsiChar; var piDestLength: Integer): BOOL; stdcall; external HPSocketDLL;

// ��ͨѹ��
function SYS_Compress(const lpszSrc: PChar; dwSrcLen: LongWord; var lpszDest: PChar; var pdwDestLen: LongWord): Integer; stdcall; external HPSocketDLL;
// �߼�ѹ����Ĭ��ֵ��iLevel -> -1��iMethod -> 8��iWindowBits -> 15��iMemLevel -> 8��iStrategy -> 0��

function SYS_CompressEx(const lpszSrc: PChar; dwSrcLen: LongWord; var lpszDest: PChar; var pdwDestLen: LongWord; iLevel: Integer; iMethod: Integer; iWindowBits: Integer; iMemLevel: Integer; iStrategy: Integer): Integer; stdcall; external HPSocketDLL;
// ��ͨ��ѹ

function SYS_Uncompress(const lpszSrc: PChar; dwSrcLen: LongWord; var lpszDest: PChar; var pdwDestLen: LongWord): Integer; stdcall; external HPSocketDLL;
// �߼���ѹ��Ĭ��ֵ��iWindowBits -> 15��

function SYS_UncompressEx(const lpszSrc: PChar; dwSrcLen: LongWord; var lpszDest: PChar; var pdwDestLen: LongWord; iWindowBits: Integer): Integer; stdcall; external HPSocketDLL;
// �Ʋ�ѹ���������

function SYS_GuessCompressBound(dwSrcLen: LongWord; bGZip: BOOL): LongWord; stdcall; external HPSocketDLL;

// Gzip ѹ��
function SYS_GZipCompress(const lpszSrc: PChar; dwSrcLen: LongWord; var lpszDest: PChar; var pdwDestLen: LongWord): Integer; stdcall; external HPSocketDLL;
// Gzip ��ѹ

function SYS_GZipUncompress(const lpszSrc: PChar; dwSrcLen: LongWord; var lpszDest: PChar; var pdwDestLen: LongWord): Integer; stdcall; external HPSocketDLL;
// �Ʋ� Gzip ��ѹ������ȣ�������� 0 �򲻺���ֵ��˵���������ݲ�����Ч�� Gzip ��ʽ��

function SYS_GZipGuessUncompressBound(const lpszSrc: PChar; dwSrcLen: LongWord): LongWord; stdcall; external HPSocketDLL;

// ���� Base64 ����󳤶�
function SYS_GuessBase64EncodeBound(dwSrcLen: LongWord): LongWord; stdcall; external HPSocketDLL;
// ���� Base64 ����󳤶�

function SYS_GuessBase64DecodeBound(const lpszSrc: PChar; dwSrcLen: LongWord): LongWord; stdcall; external HPSocketDLL;
// Base64 ���루����ֵ��0 -> �ɹ���-3 -> �������ݲ���ȷ��-5 -> ������������㣩

function SYS_Base64Encode(const lpszSrc: PChar; dwSrcLen: LongWord; var lpszDest: PChar; var pdwDestLen: LongWord): Integer; stdcall; external HPSocketDLL;
// Base64 ���루����ֵ��0 -> �ɹ���-3 -> �������ݲ���ȷ��-5 -> ������������㣩

function SYS_Base64Decode(const lpszSrc: PChar; dwSrcLen: LongWord; var lpszDest: PChar; var pdwDestLen: LongWord): Integer; stdcall; external HPSocketDLL;

// ���� URL ����󳤶�
function SYS_GuessUrlEncodeBound(const lpszSrc: PChar; dwSrcLen: LongWord): LongWord; stdcall; external HPSocketDLL;
// ���� URL ����󳤶�

function SYS_GuessUrlDecodeBound(const lpszSrc: PChar; dwSrcLen: LongWord): LongWord; stdcall; external HPSocketDLL;
// URL ���루����ֵ��0 -> �ɹ���-3 -> �������ݲ���ȷ��-5 -> ������������㣩

function SYS_UrlEncode(lpszSrc: PChar; dwSrcLen: LongWord; var lpszDest: PChar; var pdwDestLen: LongWord): Integer; stdcall; external HPSocketDLL;
// URL ���루����ֵ��0 -> �ɹ���-3 -> �������ݲ���ȷ��-5 -> ������������㣩

function SYS_UrlDecode(lpszSrc: PChar; dwSrcLen: LongWord; var lpszDest: PChar; var pdwDestLen: LongWord): Integer; stdcall; external HPSocketDLL;


// *****************************************************************************************************************************************************/
// ******************************************************************** HTTP Exports *******************************************************************/
// *****************************************************************************************************************************************************/

// ****************************************************/
// ******************* HTTP �ص����� *******************/

type
  // * HTTP �ص����� */
  HP_FN_Http_OnMessageBegin = function(pSender: HP_Http; dwConnID: HP_CONNID): En_HP_HttpParseResult; stdcall;

  HP_FN_Http_OnRequestLine = function(pSender: HP_Http; dwConnID: HP_CONNID; lpszMethod: PChar; lpszUrl: PChar): En_HP_HttpParseResult; stdcall;

  HP_FN_Http_OnStatusLine = function(pSender: HP_Http; dwConnID: HP_CONNID; usStatusCode: USHORT; lpszDesc: PChar): En_HP_HttpParseResult; stdcall;

  HP_FN_Http_OnHeader = function(pSender: HP_Http; dwConnID: HP_CONNID; lpszName: PChar; lpszValue: PChar): En_HP_HttpParseResult; stdcall;

  HP_FN_Http_OnHeadersComplete = function(pSender: HP_Http; dwConnID: HP_CONNID): En_HP_HttpParseResult; stdcall;

  HP_FN_Http_OnBody = function(pSender: HP_Http; dwConnID: HP_CONNID; const pData: PBYTE; iLength: Integer): En_HP_HttpParseResult; stdcall;

  HP_FN_Http_OnChunkHeader = function(pSender: HP_Http; dwConnID: HP_CONNID; iLength: Integer): En_HP_HttpParseResult; stdcall;

  HP_FN_Http_OnChunkComplete = function(pSender: HP_Http; dwConnID: HP_CONNID): En_HP_HttpParseResult; stdcall;

  HP_FN_Http_OnMessageComplete = function(pSender: HP_Http; dwConnID: HP_CONNID): En_HP_HttpParseResult; stdcall;

  HP_FN_Http_OnUpgrade = function(pSender: HP_Http; dwConnID: HP_CONNID; enUpgradeType: En_HP_HttpUpgradeType): En_HP_HttpParseResult; stdcall;

  HP_FN_Http_OnParseError = function(pSender: HP_Http; dwConnID: HP_CONNID; iErrorCode: Integer; lpszErrorDesc: PChar): En_HP_HttpParseResult; stdcall;

  HP_FN_Http_OnWSMessageHeader = function(pSender: HP_Http; dwConnID: HP_CONNID; bFinal: BOOL; iReserved: byte; iOperationCode: byte; const lpszMask: array of byte; ullBodyLen: LongWord): En_HP_HandleResult; stdcall;

  HP_FN_Http_OnWSMessageBody = function(pSender: HP_Http; dwConnID: HP_CONNID; const pData: PBYTE; iLength: Integer): En_HP_HandleResult; stdcall;

  HP_FN_Http_OnWSMessageComplete = function(pSender: HP_Http; dwConnID: HP_CONNID): En_HP_HandleResult; stdcall;

  { /* HTTP Server �ص����� */ }
  HP_FN_HttpServer_OnMessageBegin = HP_FN_Http_OnMessageBegin;

  HP_FN_HttpServer_OnRequestLine = HP_FN_Http_OnRequestLine;

  HP_FN_HttpServer_OnHeader = HP_FN_Http_OnHeader;

  HP_FN_HttpServer_OnHeadersComplete = HP_FN_Http_OnHeadersComplete;

  HP_FN_HttpServer_OnBody = HP_FN_Http_OnBody;

  HP_FN_HttpServer_OnChunkHeader = HP_FN_Http_OnChunkHeader;

  HP_FN_HttpServer_OnChunkComplete = HP_FN_Http_OnChunkComplete;

  HP_FN_HttpServer_OnMessageComplete = HP_FN_Http_OnMessageComplete;

  HP_FN_HttpServer_OnUpgrade = HP_FN_Http_OnUpgrade;

  HP_FN_HttpServer_OnParseError = HP_FN_Http_OnParseError;

  HP_FN_HttpServer_OnWSMessageHeader = HP_FN_Http_OnWSMessageHeader;

  HP_FN_HttpServer_OnWSMessageBody = HP_FN_Http_OnWSMessageBody;

  HP_FN_HttpServer_OnWSMessageComplete = HP_FN_Http_OnWSMessageComplete;

  HP_FN_HttpServer_OnPrepareListen = HP_FN_Server_OnPrepareListen;

  HP_FN_HttpServer_OnAccept = HP_FN_Server_OnAccept;

  HP_FN_HttpServer_OnHandShake = HP_FN_Server_OnHandShake;

  HP_FN_HttpServer_OnReceive = HP_FN_Server_OnReceive;

  HP_FN_HttpServer_OnSend = HP_FN_Server_OnSend;

  HP_FN_HttpServer_OnClose = HP_FN_Server_OnClose;

  HP_FN_HttpServer_OnShutdown = HP_FN_Server_OnShutdown;

  { /* HTTP Agent �ص����� */ }
  HP_FN_HttpAgent_OnMessageBegin = HP_FN_Http_OnMessageBegin;

  HP_FN_HttpAgent_OnStatusLine = HP_FN_Http_OnStatusLine;

  HP_FN_HttpAgent_OnHeader = HP_FN_Http_OnHeader;

  HP_FN_HttpAgent_OnHeadersComplete = HP_FN_Http_OnHeadersComplete;

  HP_FN_HttpAgent_OnBody = HP_FN_Http_OnBody;

  HP_FN_HttpAgent_OnChunkHeader = HP_FN_Http_OnChunkHeader;

  HP_FN_HttpAgent_OnChunkComplete = HP_FN_Http_OnChunkComplete;

  HP_FN_HttpAgent_OnMessageComplete = HP_FN_Http_OnMessageComplete;

  HP_FN_HttpAgent_OnUpgrade = HP_FN_Http_OnUpgrade;

  HP_FN_HttpAgent_OnParseError = HP_FN_Http_OnParseError;

  HP_FN_HttpAgent_OnWSMessageHeader = HP_FN_Http_OnWSMessageHeader;

  HP_FN_HttpAgent_OnWSMessageBody = HP_FN_Http_OnWSMessageBody;

  HP_FN_HttpAgent_OnWSMessageComplete = HP_FN_Http_OnWSMessageComplete;

  HP_FN_HttpAgent_OnPrepareConnect = HP_FN_Agent_OnPrepareConnect;

  HP_FN_HttpAgent_OnConnect = HP_FN_Agent_OnConnect;

  HP_FN_HttpAgent_OnHandShake = HP_FN_Agent_OnHandShake;

  HP_FN_HttpAgent_OnReceive = HP_FN_Agent_OnReceive;

  HP_FN_HttpAgent_OnSend = HP_FN_Agent_OnSend;

  HP_FN_HttpAgent_OnClose = HP_FN_Agent_OnClose;

  HP_FN_HttpAgent_OnShutdown = HP_FN_Agent_OnShutdown;

  { /* HTTP Client �ص����� */ }
  HP_FN_HttpClient_OnMessageBegin = HP_FN_Http_OnMessageBegin;

  HP_FN_HttpClient_OnStatusLine = HP_FN_Http_OnStatusLine;

  HP_FN_HttpClient_OnHeader = HP_FN_Http_OnHeader;

  HP_FN_HttpClient_OnHeadersComplete = HP_FN_Http_OnHeadersComplete;

  HP_FN_HttpClient_OnBody = HP_FN_Http_OnBody;

  HP_FN_HttpClient_OnChunkHeader = HP_FN_Http_OnChunkHeader;

  HP_FN_HttpClient_OnChunkComplete = HP_FN_Http_OnChunkComplete;

  HP_FN_HttpClient_OnMessageComplete = HP_FN_Http_OnMessageComplete;

  HP_FN_HttpClient_OnUpgrade = HP_FN_Http_OnUpgrade;

  HP_FN_HttpClient_OnParseError = HP_FN_Http_OnParseError;

  HP_FN_HttpClient_OnWSMessageHeader = HP_FN_Http_OnWSMessageHeader;

  HP_FN_HttpClient_OnWSMessageBody = HP_FN_Http_OnWSMessageBody;

  HP_FN_HttpClient_OnWSMessageComplete = HP_FN_Http_OnWSMessageComplete;

  HP_FN_HttpClient_OnPrepareConnect = HP_FN_Client_OnPrepareConnect;

  HP_FN_HttpClient_OnConnect = HP_FN_Client_OnConnect;

  HP_FN_HttpClient_OnHandShake = HP_FN_Client_OnHandShake;

  HP_FN_HttpClient_OnReceive = HP_FN_Client_OnReceive;

  HP_FN_HttpClient_OnSend = HP_FN_Client_OnSend;

  HP_FN_HttpClient_OnClose = HP_FN_Client_OnClose;

  // ****************************************************/
  // ***************** HTTP ���󴴽����� *****************/

  // ���� HP_HttpServer ����
function Create_HP_HttpServer(pListener: HP_HttpServerListener): HP_HttpServer; stdcall; external HPSocketDLL;
// ���� HP_HttpAgent ����

function Create_HP_HttpAgent(pListener: HP_HttpAgentListener): HP_HttpAgent; stdcall; external HPSocketDLL;
// ���� HP_HttpClient ����

function Create_HP_HttpClient(pListener: HP_HttpClientListener): HP_HttpClient; stdcall; external HPSocketDLL;
// ���� HP_HttpClient ����

function Create_HP_HttpSyncClient(pListener: HP_HttpClientListener): HP_HttpSyncClient; stdcall; external HPSocketDLL;

// ���� HP_HttpServer ����
procedure Destroy_HP_HttpServer(pServer: HP_HttpServer); stdcall; external HPSocketDLL;
// ���� HP_HttpAgent ����

procedure Destroy_HP_HttpAgent(pAgent: HP_HttpAgent); stdcall; external HPSocketDLL;
// ���� HP_HttpClient ����

procedure Destroy_HP_HttpClient(pClient: HP_HttpClient); stdcall; external HPSocketDLL;
// ���� HP_HttpSyncClient ����

procedure Destroy_HP_HttpSyncClient(pClient: HP_HttpSyncClient); stdcall; external HPSocketDLL;

// ���� HP_HttpServerListener ����
function Create_HP_HttpServerListener(): HP_HttpServerListener; stdcall; external HPSocketDLL;
// ���� HP_HttpAgentListener ����

function Create_HP_HttpAgentListener(): HP_HttpAgentListener; stdcall; external HPSocketDLL;
// ���� HP_HttpClientListener ����

function Create_HP_HttpClientListener(): HP_HttpClientListener; stdcall; external HPSocketDLL;

// ���� HP_HttpServerListener ����
procedure Destroy_HP_HttpServerListener(pListener: HP_HttpServerListener); stdcall; external HPSocketDLL;
// ���� HP_HttpAgentListener ����

procedure Destroy_HP_HttpAgentListener(pListener: HP_HttpAgentListener); stdcall; external HPSocketDLL;
// ���� HP_HttpClientListener ����

procedure Destroy_HP_HttpClientListener(pListener: HP_HttpClientListener); stdcall; external HPSocketDLL;

// **********************************************************************************/
// *************************** HTTP Server �ص��������÷��� **************************/

procedure HP_Set_FN_HttpServer_OnMessageBegin(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnMessageBegin); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnRequestLine(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnRequestLine); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnHeader(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnHeader); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnHeadersComplete(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnHeadersComplete); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnBody(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnBody); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnChunkHeader(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnChunkHeader); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnChunkComplete(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnChunkComplete); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnMessageComplete(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnMessageComplete); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnUpgrade(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnUpgrade); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnParseError(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnParseError); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnWSMessageHeader(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnWSMessageHeader); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnWSMessageBody(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnWSMessageBody); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnWSMessageComplete(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnWSMessageComplete); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnPrepareListen(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnPrepareListen); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnAccept(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnAccept); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnHandShake(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnHandShake); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnReceive(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnReceive); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnSend(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnSend); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnClose(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnClose); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpServer_OnShutdown(pListener: HP_HttpServerListener; fn: HP_FN_HttpServer_OnShutdown); stdcall; external HPSocketDLL;

// **********************************************************************************/
// **************************** HTTP Agent �ص��������÷��� **************************/

procedure HP_Set_FN_HttpAgent_OnMessageBegin(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnMessageBegin); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnStatusLine(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnStatusLine); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnHeader(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnHeader); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnHeadersComplete(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnHeadersComplete); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnBody(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnBody); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnChunkHeader(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnChunkHeader); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnChunkComplete(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnChunkComplete); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnMessageComplete(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnMessageComplete); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnUpgrade(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnUpgrade); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnParseError(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnParseError); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnWSMessageHeader(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnWSMessageHeader); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnWSMessageBody(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnWSMessageBody); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnWSMessageComplete(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnWSMessageComplete); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnPrepareConnect(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnPrepareConnect); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnConnect(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnConnect); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnHandShake(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnHandShake); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnReceive(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnReceive); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnSend(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnSend); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnClose(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnClose); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpAgent_OnShutdown(pListener: HP_HttpAgentListener; fn: HP_FN_HttpAgent_OnShutdown); stdcall; external HPSocketDLL;

// **********************************************************************************/
// *************************** HTTP Client �ص��������÷��� **************************/

procedure HP_Set_FN_HttpClient_OnMessageBegin(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnMessageBegin); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnStatusLine(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnStatusLine); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnHeader(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnHeader); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnHeadersComplete(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnHeadersComplete); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnBody(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnBody); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnChunkHeader(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnChunkHeader); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnChunkComplete(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnChunkComplete); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnMessageComplete(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnMessageComplete); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnUpgrade(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnUpgrade); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnParseError(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnParseError); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnWSMessageHeader(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnWSMessageHeader); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnWSMessageBody(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnWSMessageBody); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnWSMessageComplete(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnWSMessageComplete); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnPrepareConnect(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnPrepareConnect); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnConnect(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnConnect); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnHandShake(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnHandShake); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnReceive(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnReceive); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnSend(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnSend); stdcall; external HPSocketDLL;

procedure HP_Set_FN_HttpClient_OnClose(pListener: HP_HttpClientListener; fn: HP_FN_HttpClient_OnClose); stdcall; external HPSocketDLL;

// **************************************************************************/
// ********************** HTTP  Server �������� *****************************/

// *
{ * ���ƣ��ظ�����
  * ��������ͻ��˻ظ� HTTP ����
  *
  * ������		dwConnID		-- ���� ID
  *			usStatusCode	-- HTTP ״̬��
  *			lpszDesc		-- HTTP ״̬����
  *			lpHeaders		-- �ظ�����ͷ
  *			iHeaderCount	-- �ظ�����ͷ����
  *			pData			-- �ظ�������
  *			iLength			-- �ظ������峤��
  * ����ֵ��	TRUE			-- �ɹ�
  *			FALSE			-- ʧ��
  */ }
function HP_HttpServer_SendResponse(pServer: HP_HttpServer; dwConnID: HP_CONNID; usStatusCode: USHORT; lpszDesc: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer; const pData: PBYTE; iLength: Integer): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ����ͱ����ļ�
  * ��������ָ�����ӷ��� 4096 KB ���µ�С�ļ�
  *
  * ������		dwConnID		-- ���� ID
  *			lpszFileName	-- �ļ�·��
  *			usStatusCode	-- HTTP ״̬��
  *			lpszDesc		-- HTTP ״̬����
  *			lpHeaders		-- �ظ�����ͷ
  *			iHeaderCount	-- �ظ�����ͷ����
  * ����ֵ��	TRUE			-- �ɹ�
  *			FALSE			-- ʧ��
  */ }
function HP_HttpServer_SendLocalFile(pServer: HP_HttpServer; dwConnID: HP_CONNID; lpszFileName: PChar; usStatusCode: USHORT; lpszDesc: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;
{ /*
  * ���ƣ����� WebSocket ��Ϣ
  * ��������Զ˶˷��� WebSocket ��Ϣ
  *
  * ������		dwConnID		-- ���� ID
  *			bFinal			-- �Ƿ����֡
  *			iReserved		-- RSV1/RSV2/RSV3 �� 1 λ
  *			iOperationCode	-- �����룺0x0 - 0xF
  *			lpszMask		-- ���루nullptr �� 4 �ֽ����룬���Ϊ nullptr ��û�����룩
  *			pData			-- ��Ϣ�����ݻ�����
  *			iLength			-- ��Ϣ�����ݳ���
  *			ullBodyLen		-- ��Ϣ�ܳ���
  * 								ullBodyLen = 0		 -> ��Ϣ�ܳ���Ϊ iLength
  * 								ullBodyLen = iLength -> ��Ϣ�ܳ���Ϊ ullBodyLen
  * 								ullBodyLen > iLength -> ��Ϣ�ܳ���Ϊ ullBodyLen��������Ϣ�峤��Ϊ ullBOdyLen - iLength��������Ϣ��ͨ���ײ㷽�� Send() / SendPackets() ����
  * 								ullBodyLen < iLength -> �������������ʧ��
  * ����ֵ��	TRUE			-- �ɹ�
  *			FALSE			-- ʧ��
  */ }

function HP_HttpServer_SendWSMessage(pServer: HP_HttpServer; dwConnID: HP_CONNID; bFinal: BOOL; iReserved: byte; iOperationCode: byte; const lpszMask: array of byte; pData: PBYTE; iLength: Integer; ullBodyLen: LongWord): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ��ͷ�����
  * �����������ӷ����ͷŶ��У��ȴ�ĳ��ʱ�䣨ͨ�� SetReleaseDelay() ���ã��ر�����
  *
  * ������		dwConnID		-- ���� ID
  * ����ֵ��	TRUE			-- �ɹ�
  *			FALSE			-- ʧ��
  */ }
function HP_HttpServer_Release(pServer: HP_HttpServer; dwConnID: HP_CONNID): BOOL; stdcall; external HPSocketDLL;

{ /*
  * ���ƣ����� HTTP ͨ��
  * ��������ͨ���������Ϊ���Զ����� HTTP ͨ��ʱ����Ҫ���ñ��������� HTTP ͨ��
  *
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡʧ��ԭ��
  */ }
function HP_HttpServer_StartHttp(pServer: HP_HttpServer; dwConnID: HP_CONNID): BOOL; stdcall; external HPSocketDLL;


// ******************************************************************************/
// ***************************** Server ���Է��ʷ��� *****************************/

// * ���������ͷ���ʱ��Ĭ�ϣ�3000 ���룩 */
procedure HP_HttpServer_SetReleaseDelay(pServer: HP_HttpServer; dwReleaseDelay: DWORD); stdcall; external HPSocketDLL;
// * ��ȡ�����ͷ���ʱ */

function HP_HttpServer_GetReleaseDelay(pServer: HP_HttpServer): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ������ URL �����루URL ��ο���EnHttpUrlField�� */

function HP_HttpServer_GetUrlFieldSet(pServer: HP_HttpServer; dwConnID: HP_CONNID): DWORD; stdcall; external HPSocketDLL;
// * ��ȡĳ�� URL ��ֵ */

function HP_HttpServer_GetUrlField(pServer: HP_HttpServer; dwConnID: HP_CONNID; enField: En_HP_HttpUrlField): PChar; stdcall; external HPSocketDLL;
// * ��ȡ���󷽷� */

function HP_HttpServer_GetMethod(pServer: HP_HttpServer; dwConnID: HP_CONNID): PChar; stdcall; external HPSocketDLL;

// * ���ñ���Э��汾 */
procedure HP_HttpServer_SetLocalVersion(pServer: HP_HttpServer; usVersion: En_HP_HttpVersion); stdcall; external HPSocketDLL;
// * ��ȡ����Э��汾 */

function HP_HttpServer_GetLocalVersion(pServer: HP_HttpServer): En_HP_HttpVersion; stdcall; external HPSocketDLL;

// * ����Ƿ�����Э�� */
function HP_HttpServer_IsUpgrade(pServer: HP_HttpServer; dwConnID: HP_CONNID): BOOL; stdcall; external HPSocketDLL;
// * ����Ƿ��� Keep-Alive ��ʶ */

function HP_HttpServer_IsKeepAlive(pServer: HP_HttpServer; dwConnID: HP_CONNID): BOOL; stdcall; external HPSocketDLL;
// * ��ȡЭ��汾 */

function HP_HttpServer_GetVersion(pServer: HP_HttpServer; dwConnID: HP_CONNID): USHORT; stdcall; external HPSocketDLL;
// * ��ȡ���� */

function HP_HttpServer_GetHost(pServer: HP_HttpServer; dwConnID: HP_CONNID): PChar; stdcall; external HPSocketDLL;
// * ��ȡ���ݳ��� */

function HP_HttpServer_GetContentLength(pServer: HP_HttpServer; dwConnID: HP_CONNID): LongWord; stdcall; external HPSocketDLL;
// * ��ȡ�������� */

function HP_HttpServer_GetContentType(pServer: HP_HttpServer; dwConnID: HP_CONNID): PChar; stdcall; external HPSocketDLL;
// * ��ȡ���ݱ��� */

function HP_HttpServer_GetContentEncoding(pServer: HP_HttpServer; dwConnID: HP_CONNID): PChar; stdcall; external HPSocketDLL;
// * ��ȡ������� */

function HP_HttpServer_GetTransferEncoding(pServer: HP_HttpServer; dwConnID: HP_CONNID): PChar; stdcall; external HPSocketDLL;
// * ��ȡЭ���������� */

function HP_HttpServer_GetUpgradeType(pServer: HP_HttpServer; dwConnID: HP_CONNID): En_HP_HttpUpgradeType; stdcall; external HPSocketDLL;
// * ��ȡ����������� */

function HP_HttpServer_GetParseErrorCode(pServer: HP_HttpServer; dwConnID: HP_CONNID; var lpszErrorDesc: PChar): USHORT; stdcall; external HPSocketDLL;

// * ��ȡĳ������ͷ����ֵ�� */
function HP_HttpServer_GetHeader(pServer: HP_HttpServer; dwConnID: HP_CONNID; lpszName: PChar; var lpszValue: PChar): BOOL; stdcall; external HPSocketDLL;
// * ��ȡĳ������ͷ����ֵ�� */

function HP_HttpServer_GetHeaders(pServer: HP_HttpServer; dwConnID: HP_CONNID; lpszName: PChar; lpszValue: array of PChar; var pdwCount: DWORD): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ��������ͷ */

function HP_HttpServer_GetAllHeaders(pServer: HP_HttpServer; dwConnID: HP_CONNID; lpHeaders: HP_THeaderAry; var pdwCount: DWORD): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ��������ͷ���� */

function HP_HttpServer_GetAllHeaderNames(pServer: HP_HttpServer; dwConnID: HP_CONNID; lpszName: array of PChar; var pdwCount: DWORD): BOOL; stdcall; external HPSocketDLL;

// * ��ȡ Cookie */
function HP_HttpServer_GetCookie(pServer: HP_HttpServer; dwConnID: HP_CONNID; lpszName: PChar; var lpszValue: PChar): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ���� Cookie */

function HP_HttpServer_GetAllCookies(pServer: HP_HttpServer; dwConnID: HP_CONNID; lpCookies: HP_TCookieAry; var pdwCount: Pointer): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ��ǰ WebSocket ��Ϣ״̬������ nullptr �򲻻�ȡ��Ӧ�ֶ� */

function HP_HttpServer_GetWSMessageState(pServer: HP_HttpServer; dwConnID: HP_CONNID; var lpbFinal: BOOL; var lpiReserved: byte; var lpiOperationCode: byte; var lpszMask: PBYTE; var lpullBodyLen: LongWord; var lpullBodyRemain: LongWord): BOOL; stdcall; external HPSocketDLL;

// * ���� HTTP ������ʽ��Ĭ�ϣ�TRUE���Զ������� */
procedure HP_HttpServer_SetHttpAutoStart(pServer: HP_HttpServer; bAutoStart: BOOL); stdcall; external HPSocketDLL;
// * ��ȡ HTTP ������ʽ */

function HP_HttpServer_IsHttpAutoStart(pServer: HP_HttpServer): BOOL; stdcall; external HPSocketDLL;

// **************************************************************************/
// ********************** HTTP  Agent �������� ******************************/

// *
{ * ���ƣ���������
  * �����������˷��� HTTP ����
  *
  * ������		dwConnID		-- ���� ID
  *			lpszMethod		-- ���󷽷�
  *			lpszPath		-- ����·��
  *			lpHeaders		-- ����ͷ
  *			iHeaderCount	-- ����ͷ����
  *			pBody			-- ������
  *			iLength			-- �����峤��
  * ����ֵ��	TRUE			-- �ɹ�
  *			FALSE			-- ʧ��
  */ }
function HP_HttpAgent_SendRequest(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszMethod: PChar; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer; const pData: PBYTE; iLength: Integer): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ����ͱ����ļ�
  * ��������ָ�����ӷ��� 4096 KB ���µ�С�ļ�
  *
  * ������		dwConnID		-- ���� ID
  *			lpszFileName	-- �ļ�·��
  *			lpszMethod		-- ���󷽷�
  *			lpszPath		-- ����·��
  *			lpHeaders		-- ����ͷ
  *			iHeaderCount	-- ����ͷ����
  * ����ֵ��	TRUE			-- �ɹ�
  *			FALSE			-- ʧ��
  */ }
function HP_HttpAgent_SendLocalFile(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszFileName: PChar; lpszMethod: PChar; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;

// * ���� POST ���� */
function HP_HttpAgent_SendPost(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer; const pBody: PBYTE; iLength: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� PUT ���� */

function HP_HttpAgent_SendPut(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer; const pBody: PBYTE; iLength: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� PATCH ���� */

function HP_HttpAgent_SendPatch(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer; const pBody: PBYTE; iLength: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� GET ���� */

function HP_HttpAgent_SendGet(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� DELETE ���� */

function HP_HttpAgent_SendDelete(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� HEAD ���� */

function HP_HttpAgent_SendHead(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� TRACE ���� */

function HP_HttpAgent_SendTrace(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� OPTIONS ���� */

function HP_HttpAgent_SendOptions(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� CONNECT ���� */

function HP_HttpAgent_SendConnect(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszHost: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;
{ /*
  * ���ƣ����� WebSocket ��Ϣ
  * ��������Զ˶˷��� WebSocket ��Ϣ
  *
  * ������		dwConnID		-- ���� ID
  *			bFinal			-- �Ƿ����֡
  *			iReserved		-- RSV1/RSV2/RSV3 �� 1 λ
  *			iOperationCode	-- �����룺0x0 - 0xF
  *			lpszMask		-- ���루nullptr �� 4 �ֽ����룬���Ϊ nullptr ��û�����룩
  *			pData			-- ��Ϣ�����ݻ�����
  *			iLength			-- ��Ϣ�����ݳ���
  *			ullBodyLen		-- ��Ϣ�ܳ���
  * 								ullBodyLen = 0		 -> ��Ϣ�ܳ���Ϊ iLength
  * 								ullBodyLen = iLength -> ��Ϣ�ܳ���Ϊ ullBodyLen
  * 								ullBodyLen > iLength -> ��Ϣ�ܳ���Ϊ ullBodyLen��������Ϣ�峤��Ϊ ullBOdyLen - iLength��������Ϣ��ͨ���ײ㷽�� Send() / SendPackets() ����
  * 								ullBodyLen < iLength -> �������������ʧ��
  * ����ֵ��	TRUE			-- �ɹ�
  *			FALSE			-- ʧ��
  */ }

function HP_HttpAgent_SendWSMessage(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; bFinal: BOOL; iReserved: byte; iOperationCode: byte; const lpszMask: array of byte; pData: PBYTE; iLength: Integer; ullBodyLen: LongWord): BOOL; stdcall; external HPSocketDLL;

{ /*
  * ���ƣ����� HTTP ͨ��
  * ��������ͨ���������Ϊ���Զ����� HTTP ͨ��ʱ����Ҫ���ñ��������� HTTP ͨ��
  *
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡʧ��ԭ��
  */ }
function HP_HttpAgent_StartHttp(pAgent: HP_HttpAgent; dwConnID: HP_CONNID): BOOL; stdcall; external HPSocketDLL;

// ******************************************************************************/
// ********************** HTTP  Agent ���Է��ʷ��� ******************************/

// * ��ȡ HTTP ״̬�� */
function HP_HttpAgent_GetStatusCode(pAgent: HP_HttpAgent; dwConnID: HP_CONNID): USHORT; stdcall; external HPSocketDLL;

// * ���ñ���Э��汾 */
procedure HP_HttpAgent_SetLocalVersion(pAgent: HP_HttpAgent; usVersion: En_HP_HttpVersion); stdcall; external HPSocketDLL;
// * ��ȡ����Э��汾 */

function HP_HttpAgent_GetLocalVersion(pAgent: HP_HttpAgent): En_HP_HttpVersion; stdcall; external HPSocketDLL;

// * ����Ƿ�����Э�� */
function HP_HttpAgent_IsUpgrade(pAgent: HP_HttpAgent; dwConnID: HP_CONNID): BOOL; stdcall; external HPSocketDLL;
// * ����Ƿ��� Keep-Alive ��ʶ */

function HP_HttpAgent_IsKeepAlive(pAgent: HP_HttpAgent; dwConnID: HP_CONNID): BOOL; stdcall; external HPSocketDLL;
// * ��ȡЭ��汾 */

function HP_HttpAgent_GetVersion(pAgent: HP_HttpAgent; dwConnID: HP_CONNID): USHORT; stdcall; external HPSocketDLL;
// * ��ȡ���ݳ��� */

function HP_HttpAgent_GetContentLength(pAgent: HP_HttpAgent; dwConnID: HP_CONNID): LongWord; stdcall; external HPSocketDLL;
// * ��ȡ�������� */

function HP_HttpAgent_GetContentType(pAgent: HP_HttpAgent; dwConnID: HP_CONNID): PChar; stdcall; external HPSocketDLL;
// * ��ȡ���ݱ��� */

function HP_HttpAgent_GetContentEncoding(pAgent: HP_HttpAgent; dwConnID: HP_CONNID): PChar; stdcall; external HPSocketDLL;
// * ��ȡ������� */

function HP_HttpAgent_GetTransferEncoding(pAgent: HP_HttpAgent; dwConnID: HP_CONNID): PChar; stdcall; external HPSocketDLL;

// * ��ȡЭ���������� */
function HP_HttpAgent_GetUpgradeType(pAgent: HP_HttpAgent; dwConnID: HP_CONNID): En_HP_HttpUpgradeType; stdcall; external HPSocketDLL;
// * ��ȡ����������� */

function HP_HttpAgent_GetParseErrorCode(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; var lpszErrorDesc: PChar): USHORT; stdcall; external HPSocketDLL;

// * ��ȡĳ������ͷ����ֵ�� */
function HP_HttpAgent_GetHeader(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszName: PChar; var lpszValue: PChar): BOOL; stdcall; external HPSocketDLL;
// * ��ȡĳ������ͷ����ֵ�� */

function HP_HttpAgent_GetHeaders(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszName: PChar; lpszValue: array of PChar; var pdwCount: DWORD): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ��������ͷ */

function HP_HttpAgent_GetAllHeaders(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpHeaders: HP_THeaderAry; var pdwCount: DWORD): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ��������ͷ���� */

function HP_HttpAgent_GetAllHeaderNames(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszName: array of PChar; var pdwCount: DWORD): BOOL; stdcall; external HPSocketDLL;

// * �����Ƿ�ʹ�� Cookie */
procedure HP_HttpAgent_SetUseCookie(pAgent: HP_HttpAgent; bUseCookie: BOOL); stdcall; external HPSocketDLL;
// * ����Ƿ�ʹ�� Cookie */

function HP_HttpAgent_IsUseCookie(pAgent: HP_HttpAgent): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ Cookie */

function HP_HttpAgent_GetCookie(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpszName: PChar; var lpszValue: PChar): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ���� Cookie */

function HP_HttpAgent_GetAllCookies(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; lpCookies: HP_TCookieAry; var pdwCount: DWORD): BOOL; stdcall; external HPSocketDLL;

// * ��ȡ��ǰ WebSocket ��Ϣ״̬������ nullptr �򲻻�ȡ��Ӧ�ֶ� */

function HP_HttpAgent_GetWSMessageState(pAgent: HP_HttpAgent; dwConnID: HP_CONNID; var lpbFinal: BOOL; var lpiReserved: byte; var lpiOperationCode: byte; var lpszMask: PBYTE; var lpullBodyLen: LongWord; var lpullBodyRemain: LongWord): BOOL; stdcall; external HPSocketDLL;

// * ���� HTTP ������ʽ��Ĭ�ϣ�TRUE���Զ������� */
procedure HP_HttpAgent_SetHttpAutoStart(pAgent: HP_HttpAgent; bAutoStart: BOOL); stdcall; external HPSocketDLL;
// * ��ȡ HTTP ������ʽ */

function HP_HttpAgent_IsHttpAutoStart(pAgent: HP_HttpAgent): BOOL; stdcall; external HPSocketDLL;

// **************************************************************************/
// *********************** HTTP Client �������� *****************************/

// *
{ * ���ƣ���������
  * �����������˷��� HTTP ����
  *
  * ������		lpszMethod		-- ���󷽷�
  *			lpszPath		-- ����·��
  *			lpHeaders		-- ����ͷ
  *			iHeaderCount	-- ����ͷ����
  *			pBody			-- ������
  *			iLength			-- �����峤��
  * ����ֵ��	TRUE			-- �ɹ�
  *			FALSE			-- ʧ��
  */ }
function HP_HttpClient_SendRequest(pClient: HP_HttpClient; lpszMethod: PChar; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer; const pBody: PBYTE; iLength: Integer): BOOL; stdcall; external HPSocketDLL;

{ //*
  * ���ƣ����ͱ����ļ�
  * ��������ָ�����ӷ��� 4096 KB ���µ�С�ļ�
  *
  * ������		dwConnID		-- ���� ID
  *			lpszFileName	-- �ļ�·��
  *			lpszMethod		-- ���󷽷�
  *			lpszPath		-- ����·��
  *			lpHeaders		-- ����ͷ
  *			iHeaderCount	-- ����ͷ����
  * ����ֵ��	TRUE			-- �ɹ�
  *			FALSE			-- ʧ��
  */ }
function HP_HttpClient_SendLocalFile(pClient: HP_HttpClient; lpszFileName: PChar; lpszMethod: PChar; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;

// * ���� POST ���� */
function HP_HttpClient_SendPost(pClient: HP_HttpClient; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer; const pBody: PBYTE; iLength: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� PUT ���� */

function HP_HttpClient_SendPut(pClient: HP_HttpClient; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer; const pBody: PBYTE; iLength: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� PATCH ���� */

function HP_HttpClient_SendPatch(pClient: HP_HttpClient; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer; const pBody: PBYTE; iLength: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� GET ���� */

function HP_HttpClient_SendGet(pClient: HP_HttpClient; lpszPath: PChar; const lpHeaders: TNVPair; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� DELETE ���� */

function HP_HttpClient_SendDelete(pClient: HP_HttpClient; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� HEAD ���� */

function HP_HttpClient_SendHead(pClient: HP_HttpClient; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� TRACE ���� */

function HP_HttpClient_SendTrace(pClient: HP_HttpClient; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� OPTIONS ���� */

function HP_HttpClient_SendOptions(pClient: HP_HttpClient; lpszPath: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;
// * ���� CONNECT ���� */

function HP_HttpClient_SendConnect(pClient: HP_HttpClient; lpszHost: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer): BOOL; stdcall; external HPSocketDLL;
{ /*
  * ���ƣ����� WebSocket ��Ϣ
  * ��������Զ˶˷��� WebSocket ��Ϣ
  *
  * ������		bFinal			-- �Ƿ����֡
  *			iReserved		-- RSV1/RSV2/RSV3 �� 1 λ
  *			iOperationCode	-- �����룺0x0 - 0xF
  *			lpszMask		-- ���루nullptr �� 4 �ֽ����룬���Ϊ nullptr ��û�����룩
  *			pData			-- ��Ϣ�����ݻ�����
  *			iLength			-- ��Ϣ�����ݳ���
  *			ullBodyLen		-- ��Ϣ�ܳ���
  * 								ullBodyLen = 0		 -> ��Ϣ�ܳ���Ϊ iLength
  * 								ullBodyLen = iLength -> ��Ϣ�ܳ���Ϊ ullBodyLen
  * 								ullBodyLen > iLength -> ��Ϣ�ܳ���Ϊ ullBodyLen��������Ϣ�峤��Ϊ ullBOdyLen - iLength��������Ϣ��ͨ���ײ㷽�� Send() / SendPackets() ����
  * 								ullBodyLen < iLength -> �������������ʧ��
  * ����ֵ��	TRUE			-- �ɹ�
  *			FALSE			-- ʧ��
  */ }

function HP_HttpClient_SendWSMessage(pClient: HP_HttpClient; bFinal: BOOL; iReserved: byte; iOperationCode: byte; const lpszMask: array of byte; pData: PBYTE; iLength: Integer; ullBodyLen: LongWord): BOOL; stdcall; external HPSocketDLL;

{ /*
  * ���ƣ����� HTTP ͨ��
  * ��������ͨ���������Ϊ���Զ����� HTTP ͨ��ʱ����Ҫ���ñ��������� HTTP ͨ��
  *
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡʧ��ԭ��
  */ }
function HP_HttpClient_StartHttp(pClient: HP_HttpClient): BOOL; stdcall; external HPSocketDLL;

// ******************************************************************************/
// ********************** HTTP Client ���Է��ʷ��� *****************************/

// * ��ȡ HTTP ״̬�� */
function HP_HttpClient_GetStatusCode(pClient: HP_HttpClient): USHORT; stdcall; external HPSocketDLL;

// * ���ñ���Э��汾 */
procedure HP_HttpClient_SetLocalVersion(pClient: HP_HttpClient; usVersion: En_HP_HttpVersion); stdcall; external HPSocketDLL;
// * ��ȡ����Э��汾 */

function HP_HttpClient_GetLocalVersion(pClient: HP_HttpClient): En_HP_HttpVersion; stdcall; external HPSocketDLL;

// * ����Ƿ�����Э�� */
function HP_HttpClient_IsUpgrade(pClient: HP_HttpClient): BOOL; stdcall; external HPSocketDLL;
// * ����Ƿ��� Keep-Alive ��ʶ */

function HP_HttpClient_IsKeepAlive(pClient: HP_HttpClient): BOOL; stdcall; external HPSocketDLL;
// * ��ȡЭ��汾 */

function HP_HttpClient_GetVersion(pClient: HP_HttpClient): USHORT; stdcall; external HPSocketDLL;
// * ��ȡ���ݳ��� */

function HP_HttpClient_GetContentLength(pClient: HP_HttpClient): LongWord; stdcall; external HPSocketDLL;
// * ��ȡ�������� */

function HP_HttpClient_GetContentType(pClient: HP_HttpClient): PChar; stdcall; external HPSocketDLL;
// * ��ȡ���ݱ��� */

function HP_HttpClient_GetContentEncoding(pClient: HP_HttpClient): PChar; stdcall; external HPSocketDLL;
// * ��ȡ������� */

function HP_HttpClient_GetTransferEncoding(pClient: HP_HttpClient): PChar; stdcall; external HPSocketDLL;
// * ��ȡЭ���������� */

function HP_HttpClient_GetUpgradeType(pClient: HP_HttpClient): En_HP_HttpUpgradeType; stdcall; external HPSocketDLL;
// * ��ȡ����������� */

function HP_HttpClient_GetParseErrorCode(pClient: HP_HttpClient; var lpszErrorDesc: PChar): USHORT; stdcall; external HPSocketDLL;

// * ��ȡĳ������ͷ����ֵ�� */
function HP_HttpClient_GetHeader(pClient: HP_HttpClient; lpszName: PChar; var lpszValue: PChar): BOOL; stdcall; external HPSocketDLL;
// * ��ȡĳ������ͷ����ֵ�� */

function HP_HttpClient_GetHeaders(pClient: HP_HttpClient; lpszName: PChar; lpszValue: array of PChar; var pdwCount: DWORD): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ��������ͷ */

function HP_HttpClient_GetAllHeaders(pClient: HP_HttpClient; lpHeaders: HP_THeaderAry; var pdwCount: DWORD): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ��������ͷ���� */

function HP_HttpClient_GetAllHeaderNames(pClient: HP_HttpClient; lpszName: array of PChar; var pdwCount: DWORD): BOOL; stdcall; external HPSocketDLL;

// * �����Ƿ�ʹ�� Cookie */
procedure HP_HttpClient_SetUseCookie(pClient: HP_HttpClient; bUseCookie: BOOL); stdcall; external HPSocketDLL;
// * ����Ƿ�ʹ�� Cookie */

function HP_HttpClient_IsUseCookie(pClient: HP_HttpClient): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ Cookie */

function HP_HttpClient_GetCookie(pClient: HP_HttpClient; lpszName: PChar; var lpszValue: PChar): BOOL; stdcall; external HPSocketDLL;
// * ��ȡ���� Cookie */

function HP_HttpClient_GetAllCookies(pClient: HP_HttpClient; lpCookies: HP_TCookieAry; var pdwCount: DWORD): BOOL; stdcall; external HPSocketDLL;

// * ��ȡ��ǰ WebSocket ��Ϣ״̬������ nullptr �򲻻�ȡ��Ӧ�ֶ� */
function HP_HttpClient_GetWSMessageState(pClient: HP_HttpClient; var lpbFinal: BOOL; var lpiReserved: byte; var lpiOperationCode: byte; var lpszMask: PBYTE; var lpullBodyLen: LongWord; var lpullBodyRemain: LongWord): BOOL; stdcall; external HPSocketDLL;

// * ���� HTTP ������ʽ��Ĭ�ϣ�TRUE���Զ������� */
procedure HP_HttpClient_SetHttpAutoStart(pClient: HP_HttpClient; bAutoStart: BOOL); stdcall; external HPSocketDLL;
// * ��ȡ HTTP ������ʽ */

function HP_HttpClient_IsHttpAutoStart(pClient: HP_HttpClient): BOOL; stdcall; external HPSocketDLL;

{ /**************************************************************************/
  /************************ HTTP Sync Client �������� ************************/ }
{ /*
  * ���ƣ����� URL ����
  * �����������˷��� HTTP URL ����
  *
  * ������		lpszMethod		-- ���󷽷�
  *			lpszUrl			-- ���� URL
  *			lpHeaders		-- ����ͷ
  *			iHeaderCount	-- ����ͷ����
  *			pBody			-- ������
  *			iLength			-- �����峤��
  *			bForceReconnect	-- ǿ���������ӣ�Ĭ�ϣ�FALSE�������� URL �������Ͷ˿�����������һ��ʱ�������������ӣ�
  * ����ֵ��	TRUE			-- �ɹ�
  *			FALSE			-- ʧ��
  */ }
function HP_HttpSyncClient_OpenUrl(pClient: HP_HttpSyncClient; lpszMethod: PChar; lpszUrl: PChar; const lpHeaders: HP_THeaderAry; iHeaderCount: Integer; const pBody: PBYTE; iLength: Integer; bForceReconnect: BOOL): BOOL; stdcall; external HPSocketDLL;
{ /*
  * ���ƣ����������
  * �����������һ���������Ӧͷ����Ӧ��Ƚ����Ϣ���÷�������ÿ�η�������ǰ�Զ����ã�
  *
  * ������
  * ����ֵ��	TRUE			-- �ɹ�
  *			FALSE			-- ʧ��
  */ }

function HP_HttpSyncClient_CleanupRequestResult(pClient: HP_HttpSyncClient): BOOL; stdcall; external HPSocketDLL;

{ /******************************************************************************/
  /************************ HTTP Sync Client ���Է��ʷ��� ************************/ }

// * �������ӳ�ʱ�����룬0��ϵͳĬ�ϳ�ʱ��Ĭ�ϣ�5000�� */
procedure HP_HttpSyncClient_SetConnectTimeout(pClient: HP_HttpSyncClient; dwConnectTimeout: DWORD); stdcall; external HPSocketDLL;
// * ��������ʱ�����룬0�����޵ȴ���Ĭ�ϣ�10000�� */

procedure HP_HttpSyncClient_SetRequestTimeout(pClient: HP_HttpSyncClient; dwRequestTimeout: DWORD); stdcall; external HPSocketDLL;

// * ��ȡ���ӳ�ʱ */
function HP_HttpSyncClient_GetConnectTimeout(pClient: HP_HttpSyncClient): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ����ʱ */

function HP_HttpSyncClient_GetRequestTimeout(pClient: HP_HttpSyncClient): DWORD; stdcall; external HPSocketDLL;

// * ��ȡ��Ӧ�� */
function HP_HttpSyncClient_GetResponseBody(pClient: HP_HttpSyncClient; var lpszBody: PBYTE; piLength: Pointer): BOOL; stdcall; external HPSocketDLL;

// **************************************************************************/
// *************************** HTTP Cookie �������� **************************/

// * ���ļ����� Cookie */
function HP_HttpCookie_MGR_LoadFromFile(lpszFile: PChar; bKeepExists: BOOL = True): BOOL; stdcall; external HPSocketDLL;
// * ���� Cookie ���ļ� */

function HP_HttpCookie_MGR_SaveToFile(lpszFile: PChar; bKeepExists: BOOL = True): BOOL; stdcall; external HPSocketDLL;
// * ���� Cookie */

function HP_HttpCookie_MGR_ClearCookies(lpszDomain: PChar = nil; lpszPath: PChar = nil): BOOL; stdcall; external HPSocketDLL;
// * �������� Cookie */

function HP_HttpCookie_MGR_RemoveExpiredCookies(lpszDomain: PChar = nil; lpszPath: PChar = nil): BOOL; stdcall; external HPSocketDLL;
// * ���� Cookie */

function HP_HttpCookie_MGR_SetCookie(lpszName: PChar; lpszValue: PChar; lpszDomain: PChar; lpszPath: PChar; iMaxAge: Integer = -1; bHttpOnly: BOOL = False; bSecure: BOOL = False; enSameSite: Integer = 0; bOnlyUpdateValueIfExists: BOOL = True): BOOL; stdcall; external HPSocketDLL;
// * ɾ�� Cookie */

function HP_HttpCookie_MGR_DeleteCookie(lpszDomain: PChar; lpszPath: PChar; lpszName: PChar): BOOL; stdcall; external HPSocketDLL;
// * �����Ƿ����������� Cookie */

function HP_HttpCookie_MGR_SetEnableThirdPartyCookie(bEnableThirdPartyCookie: BOOL = True): BOOL; stdcall; external HPSocketDLL;
// * ����Ƿ����������� Cookie */

function HP_HttpCookie_MGR_IsEnableThirdPartyCookie(): BOOL; stdcall; external HPSocketDLL;

// * Cookie expires �ַ���ת��Ϊ���� */
function HP_HttpCookie_HLP_ParseExpires(lpszExpires: PChar; var ptmExpires: LongWord): BOOL; stdcall; external HPSocketDLL;
// * ����ת��Ϊ Cookie expires �ַ��� */

function HP_HttpCookie_HLP_MakeExpiresStr(lpszBuff: array of Char; var piBuffLen: PInteger; tmExpires: Integer): Boolean; stdcall; external HPSocketDLL;
// * ���� Cookie �ַ��� */

function HP_HttpCookie_HLP_ToString(lpszBuff: array of Char; var piBuffLen: Integer; lpszName: PChar; lpszValue: PChar; lpszDomain: PChar; lpszPath: PChar; iMaxAge: Integer = -1; bHttpOnly: BOOL = False; bSecure: BOOL = False; enSameSite: Integer = 0): BOOL; stdcall; external HPSocketDLL;

// * ��ȡ��ǰ UTC ʱ�� */
function HP_HttpCookie_HLP_CurrentUTCTime(): Int64; stdcall; external HPSocketDLL;
// * Max-Age -> expires */

function HP_HttpCookie_HLP_MaxAgeToExpires(iMaxAge: Integer): Int64; stdcall; external HPSocketDLL;
// * expires -> Max-Age */

function HP_HttpCookie_HLP_ExpiresToMaxAge(tmExpires: Int64): Integer; stdcall; external HPSocketDLL;

{ /*****************************************************************************************************************************************************/
  /**************************************************************** Thread Pool Exports ****************************************************************/
  /*****************************************************************************************************************************************************/ }

{ /****************************************************/
  /******************* ���󴴽����� ********************/ }

// ���� IHPThreadPool ����
function Create_HP_ThreadPool(): HP_ThreadPool; stdcall; external HPSocketDLL;
// ���� IHPThreadPool ����

procedure Destroy_HP_ThreadPool(pThreadPool: HP_ThreadPool); stdcall; external HPSocketDLL;

{ /*
  * ���ƣ����� TSocketTask ����
  * ����������������󣬸ö����������� HP_Destroy_SocketTaskObj() ����
  *
  * ������		fnTaskProc	-- ����������
  *			pSender		-- �������
  *			dwConnID	-- ���� ID
  *			pBuffer		-- ���ݻ�����
  *			iBuffLen	-- ���ݻ���������
  *			enBuffType	-- ���ݻ��������ͣ�Ĭ�ϣ�TBT_COPY��
  *							TBT_COPY	���������pBuffer ���Ƶ� TSocketTask ���󡣴˺� TSocketTask ������ pBuffer �������κι���
  *											-> ������ pBuffer ����� pBuffer �������ڲ��ܿصĳ���
  *							TBT_REFER	����ǳ������pBuffer �����Ƶ� TSocketTask ������ȷ�� TSocketTask �������������� pBuffer ������Ч
  *											-> ������ pBuffer �ϴ�� pBuffer �����ã����� pBuffer ���������ܿصĳ���
  *							TBT_ATTACH	����������ִ��ǳ�������� TSocketTask ������� pBuffer ������Ȩ���������ͷ� pBuffer�������λ���������
  *											-> ע�⣺pBuffer ������ SYS_Malloc() �����������ʹ�ñ����ͣ�������ܻᷢ���ڴ���ʴ���
  *			wParam		-- �Զ������
  *			lParam		-- �Զ������
  * ����ֵ��	HP_LPTSocketTask
  */ }
function Create_HP_SocketTaskObj(fnTaskProc: Fn_SocketTaskProc; pSender: PVOID; dwConnID: HP_CONNID; pBuffer: PBYTE; iBuffLen: Integer; enBuffType: En_HP_TaskBufferType = TBT_COPY; wParam: wParam = 0; lParam: lParam = 0): HP_LPTSocketTask; stdcall; external HPSocketDLL;

// ���� TSocketTask ����
procedure Destroy_HP_SocketTaskObj(pTask: HP_LPTSocketTask); stdcall; external HPSocketDLL;

{ /***********************************************************************/
  /***************************** ����������� *****************************/ }

{ /*
  * ���ƣ������̳߳����
  * ������
  *
  * ������		dwThreadCount		-- �߳���������Ĭ�ϣ�0��
  *									>0 -> dwThreadCount
  *									=0 -> (CPU���� * 2 + 2)
  *									<0 -> (CPU���� * (-dwThreadCount))
  *			dwMaxQueueSize		-- ����������������Ĭ�ϣ�0�������ƣ�
  *			enRejectedPolicy	-- ����ܾ���������
  *									TRP_CALL_FAIL��Ĭ�ϣ�	�����̷���ʧ��
  *									TRP_WAIT_FOR			���ȴ���ֱ���ɹ�����ʱ���̳߳عرյ�ԭ����ʧ�ܣ�
  *									TRP_CALLER_RUN			���������߳�ֱ��ִ��
  *			dwStackSize			-- �̶߳�ջ�ռ��С��Ĭ�ϣ�0 -> ����ϵͳĬ�ϣ�
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡϵͳ�������
  */ }
function HP_ThreadPool_Start(pThreadPool: HP_ThreadPool; dwThreadCount: DWORD = 0; dwMaxQueueSize: DWORD = 0; enRejectedPolicy: En_HP_RejectedPolicy = TRP_CALL_FAIL; dwStackSize: DWORD = 0): BOOL; stdcall; external HPSocketDLL;

{ /*
  * ���ƣ��ر��̳߳����
  * �������ڹ涨ʱ���ڹر��̳߳��������������߳������ȴ�ʱ����δ�������رգ��᳢��ǿ�ƹرգ���������ºܿ��ܻ����ϵͳ��Դй©
  *
  * ������		dwMaxWait	-- ���ȴ�ʱ�䣨���룬Ĭ�ϣ�INFINITE��һֱ�ȴ���
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡϵͳ�������
  */ }
function HP_ThreadPool_Stop(pThreadPool: HP_ThreadPool; dwMaxWait: DWORD = INFINITE): BOOL; stdcall; external HPSocketDLL;

{ /*
  * ���ƣ��ύ����
  * ���������̳߳��ύ�첽����
  *
  * ������		fnTaskProc	-- ����������
  *			pvArg		-- �������
  *			dwMaxWait	-- �����ύ���ȴ�ʱ�䣨���� TRP_WAIT_FOR �����̳߳���Ч��Ĭ�ϣ�INFINITE��һֱ�ȴ���
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡϵͳ�������
  *							���У������� ERROR_DESTINATION_ELEMENT_FULL ��ʾ�����������
  */ }
function HP_ThreadPool_Submit(pThreadPool: HP_ThreadPool; fnTaskProc: HP_Fn_TaskProc; pvArg: PVOID; dwMaxWait: DWORD = INFINITE): BOOL; stdcall; external HPSocketDLL;

{ /*
  * ���ƣ��ύ Socket ����
  * ���������̳߳��ύ�첽 Socket ����
  *
  * ������		pTask		-- �������
  *			dwMaxWait	-- �����ύ���ȴ�ʱ�䣨���� TRP_WAIT_FOR �����̳߳���Ч��Ĭ�ϣ�INFINITE��һֱ�ȴ���
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡϵͳ�������
  *							���У������� ERROR_DESTINATION_ELEMENT_FULL ��ʾ�����������
  *							ע�⣺����ύʧ�ܣ���Ҫ�ֹ����� Destroy_HP_SocketTaskObj() ���� TSocketTask ����
  */ }
function HP_ThreadPool_Submit_Task(pThreadPool: HP_ThreadPool; pTask: HP_LPTSocketTask; dwMaxWait: DWORD = INFINITE): BOOL; stdcall; external HPSocketDLL;

{ /*
  * ���ƣ������̳߳ش�С
  * ���������ӻ�����̳߳صĹ����߳�����
  *
  * ������		dwNewThreadCount	-- �߳�����
  *									>0 -> dwNewThreadCount
  *									=0 -> (CPU���� * 2 + 2)
  *									<0 -> (CPU���� * (-dwNewThreadCount))
  * ����ֵ��	TRUE	-- �ɹ�
  *			FALSE	-- ʧ�ܣ���ͨ�� SYS_GetLastError() ��ȡϵͳ�������
  */ }
function HP_ThreadPool_AdjustThreadCount(pThreadPool: HP_ThreadPool; dwNewThreadCount: DWORD): BOOL; stdcall; external HPSocketDLL;

{ /***********************************************************************/
  /***************************** ���Է��ʷ��� *****************************/ }

// * ����̳߳�����Ƿ������� */
function HP_ThreadPool_HasStarted(pThreadPool: HP_ThreadPool): BOOL; stdcall; external HPSocketDLL;
// * �鿴�̳߳������ǰ״̬ */

function HP_ThreadPool_GetState(pThreadPool: HP_ThreadPool): En_HP_ServiceState; stdcall; external HPSocketDLL;
// * ��ȡ��ǰ������д�С */

function HP_ThreadPool_GetQueueSize(pThreadPool: HP_ThreadPool): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�����߳����� */

function HP_ThreadPool_GetThreadCount(pThreadPool: HP_ThreadPool): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ�������������� */

function HP_ThreadPool_GetMaxQueueSize(pThreadPool: HP_ThreadPool): DWORD; stdcall; external HPSocketDLL;
// * ��ȡ����ܾ��������� */

function HP_ThreadPool_GetRejectedPolicy(pThreadPool: HP_ThreadPool): En_HP_RejectedPolicy; stdcall; external HPSocketDLL;

implementation

initialization
  IsMultiThread := True;

end.

