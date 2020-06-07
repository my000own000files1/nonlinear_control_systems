  function create_section6(InitialConditions,PATH,section_name)
%создаёт папки в папке components, содержащие разделы главы, и заполняет её
%необходимыми компонентами
% section_name ? имя главного Tex file chapter
% PATH ? структура с путями
% InitialConditions ? начальные условия
%Есть 3 типа файлов:
%1)обычный файл ? создаётся матлабом и включается в отчёт
%2)hole file ? Для создание включаемого пустого файла, который не будет изменяться, использовать файлы
%заглушки, создаваемые функцией make_hole. 
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%Необходимо обязательно имя заглушки начинать с "hole_"
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%3)support file ? Для создание невключаемого файла,в который будет записана информация, необходимая для последующей 
%корректировки и переноса в нужные включаемые файлы , использовать support(поддержки) файлы,
%Этот файл не включается в итоговый отчёт, но информация в нём изменяется
%при каждом запуске матлаб кода.
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%Необходимо обязательно имя файла начинать с "support_"
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% Естественно, что включаемые файлы будут следовать в порядке , в которром вы задавали их имена в
% "Создание имен для включаемых файлов...", поэтому порядок их размещения важен.
section_title = 'Исследование влияния широтно-импульсной модуляции на качество проектируемой системы' ;
%% Создание имен файлов и заглушек
Cellname_subsection{1} =  'DCS'; 
 %Cellname_subsection{2} =  'final_VSS';
% Cellname_subsection{3} =  'VSS_steady_degenerate_motion'; 
% Cellname_subsection{4} =  'VSS_no_steady_degenerate_motion'; 
% Cellname_subsection{5} =  'VSS_sliding_mode';
%%
disp(['Обработка --- Chapter_name:"',section_name,'"']);
%% формирование пути к папке с chapter (или section)
path_subsection = [PATH.Texcomponents,section_name,'\']; %путь к папке главы(chapter),
% в которой будут храниться главы(section)или подглавы(subsection,если
% создаётся лабораторная или курсач)
%% Создание папки, содержащей главу
[status,msg]=mkdir(path_subsection);
%% формирование пути к  файлу с описанием разделов(section) главы( chapter) или подразделов разделов.
file_path=[path_subsection ,section_name,'.tex'];        %путь к файлу с описанием разделов(section) главы( chapter)
file_path = join(file_path);
fid = fopen(file_path,'w','l','UTF-8');                  
%% Заполнение главного Tex file
fprintf(fid,'%s\r',['\section{',section_title,'}']);    %запись имени новой секции

f(fid,'Существенное влияние на свойства разрабатываемой системы управления могут ввести особенности технической реализации управляющего устройства. В частности, при высоком уровне энергии в управляемом объекте реализация управляющих воздействий в виде непрерывных сигналов практически невозможна в силу больших потерь в выходных каскадах исполнительных устройств. В таких случаях выходные каскады выполняют в виде импульсных устройств, в которых непрерывный сигнал квантуется по уровню или по времени, а затем преобразуется в импульсную модулированную последовательность. Одним из видов модуляции является широтно-импульсная (ШИМ), при которой непрерывный сигнал преобразуется в последовательность импульсов одинаковой амплитуды при постоянном периоде повторения Т, а длительность импульса определяется по какому-либо закону, например, линейному, в зависи¬мости от значения входного модулируемого непрерывного сигнала.');
l(fid);
f(fid,'Управляющий сигнал формируется компаратором, когда на его инвертирующий вход подается пилообразный сигнал, а на неинвертирующий — модулирующий непрерывный сигнал. Выходные импульсы получаются прямоугольными, частота их следования равна частоте пилы, а длительность положительной части импульса связана с временем, в течение которого уровень модулирующего сигнала, подаваемого на неинвертирующий вход компаратора, оказывается выше уровня сигнала пилы, который подается на инвертирующий вход. Когда напряжение пилы выше модулирующего сигнала, на выходе будет отрицательная часть импульса.');
l(fid);
f(fid,'Следует отметить, что при смене полярности модулируемого сигнала полярность импульсов также меняется. Длительность импульсов на выходе модулятора может меняться от нуля до непрерывного сигнала, при этом амплитуда и период повторения (частота) следования импульсов остаются неизменными.');
l(fid);

for i=1:length(Cellname_subsection)
    name_subsection = Cellname_subsection{i} ; %извлекаем имя из ячейки
    if (~strncmpi(name_subsection,'support_',8)) %проверка, что это не support файл , т.к. его включать не нужно 
    fprintf(fid,'%s\r',['\input{components/',section_name,'/',name_subsection,'}']); %прописываем пути ко всем файлам
    end
end

fclose all; % необходимо для обработки файла , удаление и т.д.

%% Непосредственное создание tex files
for i=1:length(Cellname_subsection)
    name_subsection = Cellname_subsection{i} ; %извлекаем имя из ячейки
    if strncmpi(name_subsection,'hole_',5) %нужно создать файл заглушку
        description = ['Hole number:', num2str(i)];
        make_hole(path_subsection,name_subsection,description); %создаём файл-заглушку для текста
    else
        %просто создаём нужные файлы (основные функции работы с матлаб)
        if strcmp(name_subsection,Cellname_subsection{1})
           DCS(InitialConditions,PATH,path_subsection,name_subsection,section_name);    %находит коэффициенты для системы с фазовой траекторие типа "седло" .
        end
       
    end
end



%% очистка worcspace от мусора
% clc;
% clear;
% close all;
end