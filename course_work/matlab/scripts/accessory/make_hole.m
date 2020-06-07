function make_hole(path_subsection,name_subsection,description)
%������ ��������. ��� ���?
%��� ����� � �������( ������, �������� ����-����), ������� �����
%������������� � latex. �.�. ��������� ��� ���� ���, ����� ������
%������������� �������.
%��� ���� ��� �������?
%����� ���� ������� ���������� ����� ��������������� � latex ,
%������� �� ����� ������������ �������� ��� ����� ����������� matlab
%
%��� ������ �������� ������, ������� �� ����� ���������� ������������ �����
%��������, ����������� �������� make_hole.
%
%�����������, ��� ����� ��������
%����� ��������� � ������� , � �������� �� ��������� �������� �
% "�������� ���� ������ � ��������", ������� ������� �� ���������� �����
%
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%���������� ����������� ��� �������� �������� � "hole_"
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%
%���� ������� ������� ������ .tex ���� � ������ ����������, ������� �����
%����������� �������. ��������� ������ �� ����, ���� ��, �� �� ����������,
%�.�. ������ �� ������.

file_path=[path_subsection,name_subsection,'.tex'];
file_path = join(file_path);
    if exist(file_path,'file')
        disp('yes');
    else
        disp('no');
        fid = fopen(file_path,'w','l','UTF-8');
        %�������� ������� ���������
        fprintf(fid,'%s\r','%--------------------------HOLE-------------------------------');
        fprintf(fid,'%s\r','% ��� ���?');
        fprintf(fid,'%s\r','% ��� ���� � ������� �������( ������, �������� ����-����), ������� ������������� �������.');
        if nargin > 2 %�������� �������� � �����
        fprintf(fid,'%s\r','% �������� (��� ���� ����):');
        fprintf(fid,'%s\r',['% ',description]);
        end
        fclose all; % ���������� ��� ��������� ����� , �������� � �.�.
    end
end