function varargout = untitled7(varargin)
% UNTITLED7 MATLAB code for untitled7.fig
%      UNTITLED7, by itself, creates a new UNTITLED7 or raises the existing
%      singleton*.
%
%      H = UNTITLED7 returns the handle to a new UNTITLED7 or the handle to
%      the existing singleton*.
%
%      UNTITLED7('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED7.M with the given input arguments.
%
%      UNTITLED7('Property','Value',...) creates a new UNTITLED7 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled7_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled7_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled7

% Last Modified by GUIDE v2.5 16-Jan-2020 03:26:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled7_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled7_OutputFcn, ...
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


% --- Executes just before untitled7 is made visible.
function untitled7_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled7 (see VARARGIN)

% Choose default command line output for untitled7
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled7 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled7_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img1 img2 img5
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Pick the Reference Photo'),'Error','Error');
    return
end
img1=imread(path);
axes(handles.axes1);
imshow(img1);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img1 img2 img5
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Pick the Distorted Photo'),'Error','Error');
    return
end
img2=imread(path);

axes(handles.axes2);
imshow(img2);



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.radiobuttonFSIM, 'Value') == get(handles.radiobuttonFSIM, 'Max'))
    global img1 img2 img3 img4
    [FSIM, FSIMc] = FeatureSIM(img1, img2);
    set(handles.edit2,'string',FSIM);
elseif (get(handles.radiobuttonFSIMc, 'Value') == get(handles.radiobuttonFSIMc, 'Max'))
    global img1 img2 img3 img4
    [FSIM, FSIMc] = FeatureSIM(img1, img2);
    set(handles.edit2,'string',FSIMc);
elseif (get(handles.radiobuttonMSE, 'Value') == get(handles.radiobuttonMSE, 'Max'))
    global img1 img2 img3 img4
    img3=rgb2gray(img1);
    img4=rgb2gray(img2);
    [metrix_value] = metrix_mux( img3, img4, 'mse' );
    set(handles.edit2,'string',metrix_value);
elseif (get(handles.radiobuttonPSNR, 'Value') == get(handles.radiobuttonPSNR, 'Max'))
       global img1 img2 img3 img4
    img3=rgb2gray(img1);
    img4=rgb2gray(img2);
    [metrix_value] = metrix_mux( img3, img4, 'psnr' );
    set(handles.edit2,'string',metrix_value);
elseif (get(handles.radiobuttonSSIM, 'Value') == get(handles.radiobuttonSSIM, 'Max'))
    global img1 img2 img3 img4
    img3=rgb2gray(img1);
    img4=rgb2gray(img2);
    [metrix_value] = metrix_mux( img3, img4, 'ssim' );
    set(handles.edit2,'string',metrix_value);
elseif (get(handles.radiobuttonMSSIM, 'Value') == get(handles.radiobuttonMSSIM, 'Max'))
    global img1 img2 img3 img4
    img3=rgb2gray(img1);
    img4=rgb2gray(img2);
    [metrix_value] = metrix_mux( img3, img4, 'mssim' );
    set(handles.edit2,'string',metrix_value);
elseif (get(handles.radiobuttonVSNR, 'Value') == get(handles.radiobuttonVSNR, 'Max'))
    global img1 img2 img3 img4
    img3=rgb2gray(img1);
    img4=rgb2gray(img2);
    [metrix_value] = metrix_mux( img3, img4, 'VSNR' );
    set(handles.edit2,'string',metrix_value);
elseif (get(handles.radiobuttonNQM, 'Value') == get(handles.radiobuttonNQM, 'Max'))
    global img1 img2 img3 img4
    img3=rgb2gray(img1);
    img4=rgb2gray(img2);
    [metrix_value] = metrix_mux( img3, img4, 'nqm' );
    set(handles.edit2,'string',metrix_value);
elseif (get(handles.radiobuttonVIFP, 'Value') == get(handles.radiobuttonVIFP, 'Max'))
    global img1 img2 img3 img4
    img3=rgb2gray(img1);
    img4=rgb2gray(img2);
    [metrix_value] = metrix_mux( img3, img4, 'vifp' );
    set(handles.edit2,'string',metrix_value);
elseif (get(handles.radiobuttonUQI, 'Value') == get(handles.radiobuttonUQI, 'Max'))
    global img1 img2 img3 img4
    img3=rgb2gray(img1);
    img4=rgb2gray(img2);
    [metrix_value] = metrix_mux( img3, img4, 'uqi' );
    set(handles.edit2,'string',metrix_value);
elseif (get(handles.radiobuttonWSNR, 'Value') == get(handles.radiobuttonWSNR, 'Max'))
    global img1 img2 img3 img4
    img3=rgb2gray(img1);
    img4=rgb2gray(img2);
    [metrix_value] = metrix_mux( img3, img4, 'wsnr' );
    set(handles.edit2,'string',metrix_value);
else (get(handles.radiobuttonSNR, 'Value') == get(handles.radiobuttonSNR, 'Max'))
    global img1 img2 img3 img4
    img3=rgb2gray(img1);
    img4=rgb2gray(img2);
    [metrix_value] = metrix_mux( img3, img4, 'snr' );
    set(handles.edit2,'string',metrix_value);
end

if (get(handles.radiobuttonFSIM, 'Value') == get(handles.radiobuttonFSIM, 'Max'))
    global img1 img2 img3 img4 img5
    [FSIM, FSIMc] = FeatureSIM(img1, img5);
    set(handles.edit3,'string',FSIM);
elseif (get(handles.radiobuttonFSIMc, 'Value') == get(handles.radiobuttonFSIMc, 'Max'))
    global img1 img2 img3 img4 img5
    [FSIM, FSIMc] = FeatureSIM(img1, img5);
    set(handles.edit3,'string',FSIMc);
elseif (get(handles.radiobuttonMSE, 'Value') == get(handles.radiobuttonMSE, 'Max'))
    global img1 img2 img3 img4 img5
    img3=rgb2gray(img1);
    img4=rgb2gray(img5);
    [metrix_value] = metrix_mux( img3, img4, 'mse' );
    set(handles.edit3,'string',metrix_value);
elseif (get(handles.radiobuttonPSNR, 'Value') == get(handles.radiobuttonPSNR, 'Max'))
       global img1 img2 img3 img4 img5
    img3=rgb2gray(img1);
    img4=rgb2gray(img5);
    [metrix_value] = metrix_mux( img3, img4, 'psnr' );
    set(handles.edit3,'string',metrix_value);
elseif (get(handles.radiobuttonSSIM, 'Value') == get(handles.radiobuttonSSIM, 'Max'))
    global img1 img2 img3 img4 img5
    img3=rgb2gray(img1);
    img4=rgb2gray(img5);
    [metrix_value] = metrix_mux( img3, img4, 'ssim' );
    set(handles.edit3,'string',metrix_value);
elseif (get(handles.radiobuttonMSSIM, 'Value') == get(handles.radiobuttonMSSIM, 'Max'))
    global img1 img2 img3 img4 img5
    img3=rgb2gray(img1);
    img4=rgb2gray(img5);
    [metrix_value] = metrix_mux( img3, img4, 'mssim' );
    set(handles.edit2,'string',metrix_value);
elseif (get(handles.radiobuttonVSNR, 'Value') == get(handles.radiobuttonVSNR, 'Max'))
    global img1 img2 img3 img4 img5
    img3=rgb2gray(img1);
    img4=rgb2gray(img5);
    [metrix_value] = metrix_mux( img3, img4, 'VSNR' );
    set(handles.edit3,'string',metrix_value);
elseif (get(handles.radiobuttonNQM, 'Value') == get(handles.radiobuttonNQM, 'Max'))
    global img1 img2 img3 img4 img5
    img3=rgb2gray(img1);
    img4=rgb2gray(img5);
    [metrix_value] = metrix_mux( img3, img4, 'nqm' );
    set(handles.edit3,'string',metrix_value);
elseif (get(handles.radiobuttonVIFP, 'Value') == get(handles.radiobuttonVIFP, 'Max'))
    global img1 img2 img3 img4 img5
    img3=rgb2gray(img1);
    img4=rgb2gray(img5);
    [metrix_value] = metrix_mux( img3, img4, 'vifp' );
    set(handles.edit3,'string',metrix_value);
elseif (get(handles.radiobuttonUQI, 'Value') == get(handles.radiobuttonUQI, 'Max'))
    global img1 img2 img3 img4 img5
    img3=rgb2gray(img1);
    img4=rgb2gray(img5);
    [metrix_value] = metrix_mux( img3, img4, 'uqi' );
    set(handles.edit3,'string',metrix_value);
elseif (get(handles.radiobuttonWSNR, 'Value') == get(handles.radiobuttonWSNR, 'Max'))
    global img1 img2 img3 img4 img5
    img3=rgb2gray(img1);
    img4=rgb2gray(img5);
    [metrix_value] = metrix_mux( img3, img4, 'wsnr' );
    set(handles.edit3,'string',metrix_value);
else (get(handles.radiobuttonSNR, 'Value') == get(handles.radiobuttonSNR, 'Max'))
    global img1 img2 img3 img4 img5
    img3=rgb2gray(img1);
    img4=rgb2gray(img5);
    [metrix_value] = metrix_mux( img3, img4, 'snr' );
    set(handles.edit3,'string',metrix_value);
end
    
%radiobuttonFSIM_Callback(hObject, eventdata, handles);
%press = get(handles.choalg, 'SelectedObject')


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkboxFSIM.
function checkboxFSIM_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxFSIM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hint: get(hObject,'Value') returns toggle state of checkboxFSIM


% --- Executes on button press in checkboxFSIMc.
function checkboxFSIMc_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxFSIMc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxFSIMc


% --- Executes on button press in checkboxSSIM.
function checkboxSSIM_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxSSIM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxSSIM


% --- Executes on button press in radiobuttonFSIM.
function radiobuttonFSIM_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonFSIM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonFSIM



% --- Executes on button press in radiobuttonFSIMc.
function radiobuttonFSIMc_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonFSIMc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonFSIMc


% --- Executes on button press in radiobuttonMSE.
function radiobuttonMSE_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonMSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonMSE


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img1 img2 img5
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Pick the Distorted Photo'),'Error','Error');
    return
end
img5=imread(path);

axes(handles.axes3);
imshow(img5);



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
