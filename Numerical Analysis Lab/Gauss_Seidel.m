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
## @deftypefn {} {@var{retval} =} Gauss_Seidel (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: HP <hp@hp-HP-Notebook>
## Created: 2018-11-15

function ret = Gauss_Seidel (A,B)
[m n] = size(A);
  
  for i = 1:m
    diag(i) = A(i,i);
    rest(i,:) = [A(i,1:i-1) A(i,i+1:n)];
    if sum(abs(rest(i,:)))>diag(i)
      fprintf('check dominace');
      return;
    endif
  endfor
  
  X = zeros(1,n);
  ret(1,:) = X;
  for i = 2:15
    for j = 1:n
      Xrest = [X(1:j-1) X(j+1:n)];
      X(j) = (B(j)-rest(j,:)*Xrest')/diag(j);
    endfor
    ret(i,:)=X
    if abs(ret(i-1,1)-ret(i,1))<0.00001
      ret(i,:) = X;return;
    endif
    ;
  endfor
  
endfunction
