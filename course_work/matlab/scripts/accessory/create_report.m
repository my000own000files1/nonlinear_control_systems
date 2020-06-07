function  create_report(report_path,Cellname_section)
%������� �������� tex ���� ��� ��������� ������
fid = fopen(report_path,'w','l','UTF-8'); 
fprintf(fid,'%s\r','\include{common/setup}  % ����� ��������� �������');   
fprintf(fid,'\r%s\r','\begin{document}');   
fprintf(fid,'\r%s\r','\include{common/title_page}  % ��������� ����');
fprintf(fid,'\r%s\r','\tableofcontents  % ����������');
fprintf(fid,'\r%s','\include{components/ANNOTATION}');
fprintf(fid,'\r%s','\include{components/INTRODACTION}');
fprintf(fid,'\r%s\r',['\include{components/',Cellname_section{1},'/',Cellname_section{1},'}']);
for i=2:length(Cellname_section)
    fprintf(fid,'%s\r',['\include{components/',Cellname_section{i},'/',Cellname_section{i},'}']);
end
fprintf(fid,'%s\r','\include{components/CONCLUSION}');
fprintf(fid,'%s\r','\include{components/LITERATURE}');
fprintf(fid,'\r%s\r','\end{document}');
fclose all; % ���������� ��� ��������� ����� , �������� � �.�.
end