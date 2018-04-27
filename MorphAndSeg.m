function varargout = MorphAndSeg(varargin)
% MORPHANDSEG MATLAB code for MorphAndSeg.fig
%      MORPHANDSEG, by itself, creates a new MORPHANDSEG or raises the existing
%      singleton*.
%
%      H = MORPHANDSEG returns the handle to a new MORPHANDSEG or the handle to
%      the existing singleton*.
%
%      MORPHANDSEG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPHANDSEG.M with the given input arguments.
%
%      MORPHANDSEG('Property','Value',...) creates a new MORPHANDSEG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MorphAndSeg_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MorphAndSeg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MorphAndSeg

% Last Modified by GUIDE v2.5 19-Apr-2018 15:44:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MorphAndSeg_OpeningFcn, ...
                   'gui_OutputFcn',  @MorphAndSeg_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before MorphAndSeg is made visible.
function MorphAndSeg_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MorphAndSeg (see VARARGIN)

% Choose default command line output for MorphAndSeg
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MorphAndSeg wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MorphAndSeg_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in dilateBtn.
function dilateBtn_Callback(hObject, eventdata, handles)
% hObject    handle to dilateBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
global dil

bin = im2bw(img,graythresh(img) );
se = ones(3, 3);
dil = imdilate(bin, se);
guidata(hObject,handles);
axes(handles.pb2);
imshow(dil);

val = sprintf('Dilation');
set(handles.st2, 'String', val);

% --- Executes on button press in erodeBtn.
function erodeBtn_Callback(hObject, eventdata, handles)
% hObject    handle to erodeBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
global ero

bin = im2bw(img,graythresh(img) );
se = ones(3, 3);
ero = imerode(bin, se);
guidata(hObject,handles);
axes(handles.pb3);
imshow(ero);

val = sprintf('Erosion');
set(handles.st3, 'String', val);


% --- Executes on button press in openBtn.
function openBtn_Callback(hObject, eventdata, handles)
% hObject    handle to openBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
global op

bin = im2bw(img,graythresh(img) );
se = ones(3, 3);
op = imopen(bin, se);
guidata(hObject,handles);
axes(handles.pb2);
imshow(op);

val = sprintf('Opening');
set(handles.st2, 'String', val);


% --- Executes on button press in closeBtn.
function closeBtn_Callback(hObject, eventdata, handles)
% hObject    handle to closeBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
global cl
bin = im2bw(img,graythresh(img));
se = ones(3, 3);
cl = imclose(bin, se);
guidata(hObject,handles);
axes(handles.pb3);
imshow(cl);

val = sprintf('Closing');
set(handles.st3, 'String', val);


% --- Executes on button press in thinBtn.
function thinBtn_Callback(hObject, eventdata, handles)
% hObject    handle to thinBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
global thin
bin = im2bw(img,graythresh(img));
thin = bwmorph(bin,'thin',Inf);
guidata(hObject,handles);
axes(handles.pb2);
imshow(thin);

val = sprintf('Thinning');
set(handles.st2, 'String', val);


% --- Executes on button press in sobelBtn.
function sobelBtn_Callback(hObject, eventdata, handles)
% hObject    handle to sobelBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img

bin = im2bw(img,graythresh(img));
sobHor = edge(bin,'sobel','horizontal');
sobVer = edge(bin,'sobel','vertical');
sobGmag = imgradient(bin,'sobel');

guidata(hObject,handles);
axes(handles.pb2);
imshow(sobHor);
val = sprintf('Sobel Horizontal');
set(handles.st2, 'String', val);

guidata(hObject,handles);
axes(handles.pb3);
imshow(sobVer);
val = sprintf('Sobel Vertical');
set(handles.st3, 'String', val);

guidata(hObject,handles);
axes(handles.pb4);
imshow(sobGmag);
val = sprintf('Sobel Gradient Magnitude');
set(handles.st4, 'String', val);



% --- Executes on button press in robertBtn.
function robertBtn_Callback(hObject, eventdata, handles)
% hObject    handle to robertBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img

bin = im2bw(img,graythresh(img));
rbHor = edge(bin,'roberts','horizontal');
rbVer = edge(bin,'roberts','vertical');
rbGmag = imgradient(bin,'roberts');

guidata(hObject,handles);
axes(handles.pb2);
imshow(rbHor);
val = sprintf('Roberts Horizontal');
set(handles.st2, 'String', val);

guidata(hObject,handles);
axes(handles.pb3);
imshow(rbVer);
val = sprintf('Roberts Vertical');
set(handles.st3, 'String', val);

guidata(hObject,handles);
axes(handles.pb4);
imshow(rbGmag);
val = sprintf('Roberts Gradient Magnitude');
set(handles.st4, 'String', val);

% --- Executes on button press in prewittBtn.
function prewittBtn_Callback(hObject, eventdata, handles)
% hObject    handle to prewittBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img

bin = im2bw(img,graythresh(img));
pwHor = edge(bin,'prewitt','horizontal');
pwVer = edge(bin,'prewitt','vertical');
pwGmag = imgradient(bin,'prewitt');

guidata(hObject,handles);
axes(handles.pb2);
imshow(pwHor);
val = sprintf('Prewitt Horizontal');
set(handles.st2, 'String', val);

guidata(hObject,handles);
axes(handles.pb3);
imshow(pwVer);
val = sprintf('Prewitt Vertical');
set(handles.st3, 'String', val);

guidata(hObject,handles);
axes(handles.pb4);
imshow(pwGmag);
val = sprintf('Prewitt Gradient Magnitude');
set(handles.st4, 'String', val);

% --- Executes on button press in cannyBtn.
function cannyBtn_Callback(hObject, eventdata, handles)
% hObject    handle to cannyBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img

bin = im2bw(img,graythresh(img));
can = edge(bin,'canny');

guidata(hObject,handles);
axes(handles.pb2);
imshow(can);
val = sprintf('Canny');
% null = sprintf(' ');
set(handles.st2, 'String', val);
% set(handles.st3, 'String', null);
% set(handles.st4, 'String', null);
% cla(handles.pb3);
% cla(handles.pb4);


% --- Executes on button press in logBtn.
function logBtn_Callback(hObject, eventdata, handles)
% hObject    handle to logBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img

bin = im2bw(img,graythresh(img));
log = edge(bin,'log');

axes(handles.pb3);
imshow(log);

val = sprintf('Laplacian of Gaussian (LOG)');
% null = sprintf(' ');
set(handles.st3, 'String', val);
% set(handles.st3, 'String', null);
% set(handles.st4, 'String', null);
% cla(handles.pb3);
% cla(handles.pb4);


% --- Executes on button press in browseBtn.
function browseBtn_Callback(hObject, eventdata, handles)
% hObject    handle to browseBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
[nama_file, nama_path] = uigetfile('*.png;*.jpg;*.bmp;*.gif;*.tif','Select Image');
if ~isequal (nama_file,0)
    img = imread(fullfile(nama_path,nama_file));
    guidata(hObject,handles);
    axes(handles.pb1);
    imshow(img);
    
    null = sprintf(' ');
    set(handles.st2, 'String', null);
    set(handles.st3, 'String', null);
    set(handles.st4, 'String', null);
    cla(handles.pb2);
    cla(handles.pb3);
    cla(handles.pb4);
else
    return;
end

% --- Executes on button press in reggrowBtn.
function reggrowBtn_Callback(hObject, eventdata, handles)
% hObject    handle to reggrowBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
bin = im2bw(img,graythresh(img));
f=double(bin);
s=255;
t=65;
if numel(s)==1
    si=f==s;
    s1=s;
else
    si=bwmorph(s,'shrink',Inf);
    j=si;
    s1=f(j);
end

ti=false(size(f));

for k=1:length(s1)
    sv=s1(k);
    s=abs(f-sv)<=t;
    ti=ti|s;
end
rg = bwlabel(imreconstruct(si,ti));
axes(handles.pb2);
imshow(rg);
val = sprintf('Region Growing');
set(handles.st2, 'String', val);


% --- Executes on button press in watershedBtn.
function watershedBtn_Callback(hObject, eventdata, handles)
% hObject    handle to watershedBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
bin = im2bw(img,graythresh(img));
dist = bwdist(bin);
ws = watershed(dist);
ws = label2rgb(ws, 'spring', 'c', 'shuffle');
axes(handles.pb3);
imshow(ws);
val = sprintf('Watershed');
set(handles.st3, 'String', val);


% --- Executes on button press in exitBtn.
function exitBtn_Callback(hObject, eventdata, handles)
% hObject    handle to exitBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
