# [![Typing SVG](https://readme-typing-svg.demolab.com?font=Roboto&size=36&pause=5000&color=F7F7F7&width=435&lines=TaxiTestTask)](https://git.io/typing-svg)
<a ><img src="https://github.com/ivanvorobei/SPFakeBar/blob/master/Resources/Preview.gif?raw=true" width="240"/> 
<img src="https://github.com/ivanvorobei/SPFakeBar/blob/master/Resources/Preview.gif?raw=true" width="240"/> 
<img src="https://github.com/ivanvorobei/SPFakeBar/blob/master/Resources/Preview.gif?raw=true" width="240"/></a>

![Презентация](./presentation/1.gif)

## Оглавление
- **[Краткое описание](#Basic)**
- **[Презентация](#Presentation)**
- **[Задание](#Task)**
- **[Будет добавлено](#ComingSoon)**

## <a id="Basic"></a>Краткое описание
- Проект написан на **UIKit**
- Использована архитеутра **MVC**
- Адаптивная верстка интерфейса **кодом**. Проверна на **iPhoneSE (1st generation)**
- Работа с сетью **URLSession**
- Работа с изображениями **Kingfisher**
- При загрузке изображение кешируется и храниться в памяти в течении 10 минут.
- Добавлена обработка ошибок при работе с NetworkManager, ImageManager. Ошибки отображаются пользователю через UIAlerController.добавить 
- Добавлен индикатор загрузки изображения при работе с экраном детальной информации.
## <a id="Presentation"></a>Презентация
![Главный экран](./presentation/1.png)
![Экран детальной информации](./presentation/2.png)
![Обработка ошибок](./presentation/3.png)
![Индикатор загрузки](./presentation/4.png)
## <a id="Task"></a>Задание
- Необходимо написать приложение, которое загружает с сервера JSON-файл,
разбирает его и выводит на экран отсортированный по убыванию даты список с информацией об активных заказах в службе такси.
- В каждом элементе списка должны отображаться:
  - Начальный адрес
  - Конечный адрес
  - Дата поездки
  - Стоимость заказа
- По нажатию на элемент списка необходимо показать экран с детализацией,
где, помимо перечисленных выше полей, должны отображаться время заказа, а также информация о машине и водителе.
- При разработке приложения необходимо использовать архитектуру VIPER
- Приложение должно поддерживать iOS 13.0+ и быть оформлено в соответствии с руководством iOS Human Interface Guidelines.
Язык программирования для реализации тестового задания – Swift 5.3+
## <a id="Task"></a>Будет добавлено
- Unit testing
  
