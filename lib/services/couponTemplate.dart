class CouponTemplate {
  String compny;
  String discount;
  String exp_date;
  String coupon_code;
  String TC;

  CouponTemplate(
      {this.compny, this.discount, this.exp_date, this.TC, this.coupon_code});
}

var p = CouponTemplate(
    compny: 'Zomato',
    discount: '25% OFF',
    exp_date: '3/12/2020',
    TC: 'It is only for fun',
    coupon_code: 'SWIGGYIT');
