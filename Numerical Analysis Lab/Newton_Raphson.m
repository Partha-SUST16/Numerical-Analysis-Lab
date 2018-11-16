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
## @deftypefn {} {@var{retval} =} Newton_Raphson (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: HP <hp@hp-HP-Notebook>
## Created: 2018-11-15

function ret = Newton_Raphson (ff, a,b)
  f = inline(ff);
  dif = inline(diff(sym(ff)));
  fa = f(a);fb = f(b);
  if fa*fb>0
    return;
  endif
  x0 = (a+b)/2;
  ret(1,:) = [x0 f(x0)];
  
  for i = 2:20
    x = x0-(f(x0)/diff(x0));
    ret(i,:) = [x f(x)];
    
    if abs(ret(i-1,1)-ret(i,1))<0.0001
      break;
    endif
    x0 =x; 
  endfor
  
  plot(ret(:,2));
endfunction
