function c1=colorin(c)
  if c>=0 && c<=8
    R=0;G=0;B=127+16*c;
  end
  if c>8 && c<=24
    R=0;G=16*(c-8);B=255;
    if G>255
      G=255;
    end
  end
  if c>24 && c<=40
    R=16*(c-24);G=255;B=255-16*(c-24);
    if R>255 || B<0
      R=255;B=0;
    end
  end
  if c>40 && c<=56
    R=255;G=255-16*(c-40);B=0;
    if G<0
      G=0;
    end
  end
  if c>56 && c<=64
    R=255-16*(c-56);G=0;B=0;
  end
  c1=[R G B]/255;
end