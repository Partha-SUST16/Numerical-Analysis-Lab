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
## @deftypefn {} {@var{retval} =} RungeKutta (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: HP <hp@hp-HP-Notebook>
## Created: 2018-11-15

function ret = RungeKutta (f,xrange,y0,h)

x = xrange(1):h:xrange(2);
y = zeros(1,length(x));
y(1) = y0;

for i=1:(length(x)-1)
  k_1 = f(x(i),y(i));
  k_2 = f(x(i)+0.5*h,y(i)+0.5*h*k_1);
  k_3 = f(x(i)+0.5*h,y(i)+0.5*h*k_2);
  k_4 = f(x(i)+h,(y(i)+k_3*h));

  y(i+1) = y(i)+(1/6)*(k_1+2*k_2+2*k_3+k_4)*h;  
endfor
ret = [x' y'];
endfunction
