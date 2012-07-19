#encoding:utf-8
module NumberToCn 

  CN_T_TRANS = [ "", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖", "拾" ]
  CN_T_POSITION = [ "", "拾", "佰", "仟" ]
  CN_T_BIG = [ "", "萬", "亿"]

  def to_cn_words
    if self.class == "Fixnum"
      return "零" if self == 0
      num_arr = self.to_s.split("").reverse
      rst_arr = []

      writable = -1 
      #1：0是需要写的。
      #0：0不需要写； 
      #-1：全不需要写；

      num_arr.each_with_index do |value, index|
        writable = -1 if index%4 == 0

        cc = (index % 4 == 0) ? CN_T_BIG[index/4] : ""
        aa = CN_T_TRANS[value.to_i]

        if value.to_i == 0
          writable = (writable == 1) ? 0 : -1
        else
          writable = 1
        end

        if writable == 1
          bb = CN_T_POSITION[index%4]
        elsif writable == -1
          bb = ""
        else
          bb = "零"
        end

        rst_arr << aa + bb + cc
      end

      rst_arr.reverse.join
    end
  end
  
end