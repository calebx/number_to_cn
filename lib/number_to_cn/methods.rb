#encoding:utf-8
module NumberToCn 
  CN_T_TRANS           = [ "", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖", "拾" ]
  CN_T_TRANS_WITH_ZERO = [ "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖", "拾" ]
  CN_T_POSITION        = [ "", "拾", "佰", "仟" ]
  CN_T_BIG             = [ "", "萬", "亿", "萬" ]

  def to_cn_words
    if self.class == Fixnum
      int_words
    elsif self.class == Float
      float_words
    end
  end

  def int_words
    return "零" if self == 0

    num_arr = self.to_s.split('').reverse
    rst_arr = []

    writable = -1 
    #1： 都需要写；
    #0： 写一个零，后面的'千'不用写； 
    #-1：不需要写'千'，也不需要写'零'；

    num_arr.each_with_index do |value, index|
      writable = -1 if index%4 == 0
      cc = (index%4 == 0) ? CN_T_BIG[index/4] : ""
      aa = CN_T_TRANS[value.to_i]

      if value.to_i == 0
        bb = (writable == 1) ? "零" : ""
        writable = (writable == 1) ? 0 : -1
      else
        bb = CN_T_POSITION[index%4]
        writable = 1
      end

      rst_arr << aa + bb + cc
    end

    rst_arr.reverse.join
  end

  def float_words
    before_point     = self.to_i
    after_point      = self.to_s.split(".")[1]
    after_point_zero = "零" * (after_point.length - after_point.to_i.to_s.length)
    "#{before_point.int_words}点#{after_point_zero}#{after_point.to_i.to_cn_clearly}"
  end
  
  def to_cn_clearly
    to_s.split('')
        .delete_if{ |c| c =~ /\D/ }
        .map{ |c| CN_T_TRANS_WITH_ZERO[c.to_i] }
        .join
  end
end