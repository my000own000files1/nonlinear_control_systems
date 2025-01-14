# Курсовая работа / Course work

Цель работы: синтез управляющего устройства с переменной структурой, обеспечивающего качественные показатели системы, удовлетворяющие
заданию, при наличии в объекте управления нелинейного элемента вида "насыщение". 
---

1. [Задание](task.pdf)

1. [Отчет](Tex/report.pdf)		
		
1. 	Вспомогательные документы:
	- [Алгоритм подбора коэффициентов для системы с переменной структурой](matlab/Noties/VSS_final_synthesis.pdf)
	
1. Код отчета на языке Latex разделен на несколько файлов:

	- [Главный файл](Tex/report.tex)
	- Общие файли:
		+ [Настройка параметров для компиляции и 
			подключение модулей](Tex/common/setup.tex).
		+ [Оформление титульной страницы](Tex/common/title_page.tex).
	- [Наполнение отчета](Tex/components/):
		
1. Скрипты на языке MATLAB 
	
	Для эмуляции нажатия кнопки "F5" после окончания всех операций в MATLAB, которая запустит компиляцию кода на языке Latex используется сторонняя библиотека 
	[`INPUTEMU   Java-Based Mouse/Keyboard Emulator`](matlab/scripts/accessory/inputemu_v1.0.1/inputemu.m)
	
	и используется сторонняя библиотека 
	REPLACEINFILE replaces characters in ASCII file using PERL
	
	+ [Главный скрипт на языке MATLAB, создающий код на языке LaTex](matlab/make_report.m)
	

	+ Для реализации вспомогательных функций созданы:

		- Быстрое написание LaTex команд:
			+ [It just pasting a text string into latex document named by fid and line break](matlab/scripts/Latex_command/latex_text.m)
			+ [Past one image in tex document](matlab/scripts/Latex_command/text_past_figure.m)
			+ [вставка нескольких необходимых рисунков](matlab/scripts/Latex_command/past_figures.m)			
			+ и.т.д.			