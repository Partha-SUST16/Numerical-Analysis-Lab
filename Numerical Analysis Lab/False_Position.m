## Copyright (C) 2018 HP
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} False_Position (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: HP <hp@hp-HP-Notebook>
## Created: 2018-11-15

function ret = False_Position (f,a, b)
fa = f(a);fb = f(b);
if(fa*fb)>0
return
end

ret(1,:) = [a b 0 0];
for i=2:20
  x = (a*f(b)-b*f(a))/(f(b)-f(a));
  ret(i,:) = [a b x f(x)];
  if f(a)*f(x)<0
    b = x;
  elseif f(b)*f(x)<0
    a = x;
  else
    break;
  endif
  
  if (abs(ret(i-1,3)-ret(i,3))<0.0001)
    break;
  endif
endfor
plot(ret(:,4),'+-');
endfunction
