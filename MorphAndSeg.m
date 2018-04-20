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


% --- Executes on button press in robertBtn.
function robertBtn_Callback(hObject, eventdata, handles)
% hObject    handle to robertBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in prewittBtn.
function prewittBtn_Callback(hObject, eventdata, handles)
% hObject    handle to prewittBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cannyBtn.
function cannyBtn_Callback(hObject, eventdata, handles)
% hObject    handle to cannyBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in logBtn.
function logBtn_Callback(hObject, eventdata, handles)
% hObject    handle to logBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in browseBtn.
function browseBtn_Callback(hObject, eventdata, handles)
% hObject    handle to browseBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
[nama_file, nama_path] = uigetfile('*.png;*.jpg;*.bmp;*.gif','Select Image');
if ~isequal (nama_file,0)
    img = imread(fullfile(nama_path,nama_file));
    guidata(hObject,handles);
    axes(handles.pb1);
    imshow(img);
else
    return;
end

% --- Executes on button press in reggrowBtn.
function reggrowBtn_Callback(hObject, eventdata, handles)
% hObject    handle to reggrowBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in watershedBtn.
function watershedBtn_Callback(hObject, eventdata, handles)
% hObject    handle to watershedBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in exitBtn.
function exitBtn_Callback(hObject, eventdata, handles)
% hObject    handle to exitBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
