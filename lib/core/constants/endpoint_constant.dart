class UrlConstant{
  static const String LOCAL_BE = '192.168.1.8:8181';
  static const String SERVER_BE = '210.245.96.229:18686';
  static final String API_URL = 'http://${LOCAL_BE}/api';
  static final String SIGN_IN = 'users/login';
  static final String SIGN_UP = 'users/addUser';
  static final String LOG_OUT = 'users/logOut';
  static final String GET_USER_INFO = 'users/getProfile';
  static final String EDIT_USER_INFO = 'users/editUser';
  static final String GET_ALL_LIST_PRODUCT = 'items/listItem';
  static final String GET_ALL_LIST_ORDER = 'orders/listOrders';
  static final String GET_ALL_LIST_HISTORY = 'orders/listOrders';
  static final String GET_ALL_LIST_COMPLETE = 'orders/getDataComplete';
  static final String CONFIRM_ORDER = 'orders/hoanthanhNew';
  static final String ORDER_ADD = 'orders/addNew';
  static final String AVATAR = '/users/avatar/';
  static final String CHANGE_PASSWORD = 'oauth/password';
  static final String GET_ALL_LIST_ADDRESS = 'users/getAllAddress';
  static final String GET_ALL_LIST_ORDER_BY_DATE_AND_STATUS = 'orders/findByOrdersDtoNewAAndActiveIAndIdShipper';
  static final String GET_ALL_LIST_ORDER_BY_STATUS = 'orders/findByOrdersDtoNewSAndStatusAndActive';
  static final String GET_DETAIL_ORDER = 'orders/getDetailOrder';
  static final String GET_DATA_BY_TYPE = 'orders/getDataByType';
  static final String GET_LEADERBOARD = 'orders/listCompeteAndDate';
  static final String GET_LIST_FOLLOW_USER = 'orders/listFollowAndUser';
  static final String ADD_BOOKING = 'booking/addBooking';
  static final String GET_BOOKINGS = 'booking/getAllBooking';
  static final String GET_DETAIL_BOOKING = 'booking/getDetail';
  static final String REFUSE_BOOKING = 'booking/reasonBooking';
  static final String ACCESS_BOOKING = 'booking/accessBooking';
  static final String GET_STATISTIC = 'booking/getStatistic';

}