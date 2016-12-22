function varargout = GUI_new(varargin)
% GUI_NEW MATLAB code for GUI_new.fig
%      GUI_NEW, by itself, creates a new GUI_NEW or raises the existing
%      singleton*.
%
%      H = GUI_NEW returns the handle to a new GUI_NEW or the handle to
%      the existing singleton*.
%
%      GUI_NEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_NEW.M with the given input arguments.
%
%      GUI_NEW('Property','Value',...) creates a new GUI_NEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_new_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_new_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_new

% Last Modified by GUIDE v2.5 20-Dec-2016 17:21:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_new_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_new_OutputFcn, ...
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


% --- Executes just before GUI_new is made visible.
function GUI_new_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_new (see VARARGIN)
handles.brodatz = 'Brodatz\Testing\';
handles.vistex = 'VisTex\Testing\';
handles.temp_folder = handles.brodatz;
handles.current_data = handles.brodatz;

% Choose default command line output for GUI_new
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_new wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_new_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
str = get(hObject, 'String');
val = get(hObject, 'Value');
switch str{val};
    case 'brodatz'
        handles.current_data = handles.brodatz;
        handles.temp_folder = handles.brodatz;
    case 'vistex'
        handles.temp_folder = handles.vistex;
        handles.current_data = handles.vistex;
end
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2

% switch handles.current_data;
%     case handles.vistex
%         str = get(hObject, 'String');
%         
%         val = get(hObject, 'Value');
%         disp(str{val});
%         switch str{val}
%             case 'original'
%                 handles.current_data = strcat(handles.temp_folder, 'original\Fabric.0002.ppm');
%                 axes(handles.axes1);
%                 imshow(handles.current_data);
%             case 'rotated'
%                 handles.current_data = strcat(handles.temp_folder, 'rotated\Fabric.0002.1.jpg');
%                 axes(handles.axes1);
%                 imshow(handles.current_data);
%             case 'scaled'
%                 handles.current_data = strcat(handles.temp_folder, 'scaled\Fabric.0002.png');
%                 axes(handles.axes1);
%                 imshow(handles.current_data);
%         end
% %         guidata(hObject, handles);
%     case handles.brodatz
%         
%         
% %         guidata(hObject, handles);
% end
str = get(hObject, 'String');
val = get(hObject, 'Value');
% disp(handles.temp_folder);
disp(size(handles.vistex));
disp(size(handles.brodatz));
disp(size(handles.temp_folder));
switch str{val}
    case 'original'
        if (size(handles.temp_folder, 2) == size(handles.vistex,2))
            if handles.temp_folder == handles.vistex
                handles.current_data = strcat(handles.temp_folder, 'original\Fabric.0002.ppm');
                axes(handles.axes1);
                handles.data = 'vistex';
                handles.type = 'original';
                imshow(handles.current_data);
            end
        else
            if handles.temp_folder == handles.brodatz
                handles.data = 'brodatz';
                handles.type = 'original';
                handles.current_data = strcat(handles.temp_folder, 'original\D1_3.jpg');
                axes(handles.axes1);
                imshow(handles.current_data);
            end
        end
    case 'rotated'
        if (size(handles.temp_folder, 2) == size(handles.brodatz, 2))
            handles.current_data = strcat(handles.temp_folder, 'rotated\D1_3_1.jpg');
            handles.type = 'rotated';
            handles.data = 'brodatz';
            axes(handles.axes1);
            imshow(handles.current_data);
        else
            handles.type = 'rotated';
            handles.data = 'vistex';
            handles.current_data = strcat(handles.temp_folder, 'rotated\Fabric.0002.1.jpg');
            axes(handles.axes1);
            imshow(handles.current_data);
        end
    case 'scaled'
        if (size(handles.temp_folder,2) == size(handles.brodatz,2))
            handles.type = 'scaled';
            handles.data = 'brodatz';
            handles.current_data = strcat(handles.temp_folder, 'scaled\D1_3.jpg');
            axes(handles.axes1);
            imshow(handles.current_data);
        else
            handles.type = 'scaled';
            handles.data = 'vistex';
            handles.current_data = strcat(handles.temp_folder, 'scaled\Fabric.0002.png');
            axes(handles.axes1);
            imshow(handles.current_data);
        end
end
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonHasil.
function pushbuttonHasil_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonHasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (size(handles.data,2) == size('brodatz',2))
    if (size(handles.type,2)== size('original',2))
        training = load('fitur_glcm.mat');
        testing = load ('fitur_glcm_original.mat');
        result = svm(training.fitur_training_Brodatz, testing.fitur_training_Brodatz);
        disp(size(result));
        hasil = classperf(result, testing.fitur_training_Brodatz(:,1));
        disp(hasil.correctrate*100);
        textLabel = sprintf('Akurasi = %f', hasil.correctrate*100);
        
        set(handles.text2, 'String', textLabel);
    elseif (size(handles.type,2) == size('rotated',2))
        training = load('fitur_glcm.mat');
        testing = load ('fitur_glcm_rotated.mat');
        result = svm(training.fitur_training_Brodatz, testing.fitur_training_Brodatz);
        hasil = classperf(result, testing.fitur_training_Brodatz(:,1));
        disp(size(result));
        textLabel = sprintf('Akurasi = %f', hasil.correctrate*100);
        
        set(handles.text2, 'String', textLabel);
    elseif (size(handles.type,2) == size('scaled',2))
        training = load('fitur_glcm.mat');
        testing = load ('fitur_glcm_scaled.mat');
        result = svm(training.fitur_training_Brodatz, testing.fitur_training_Brodatz);
        hasil = classperf(result, testing.fitur_training_Brodatz(:,1));
        disp(size(result));
        textLabel = sprintf('Akurasi = %f', hasil.correctrate*100);
        
        set(handles.text2, 'String', textLabel);
    end
elseif (size(handles.data,2) == size('vistex',2))
    if (size(handles.type,2)== size('original',2))
        training = load('fitur_glcm.mat');
        testing = load ('fitur_glcm_original.mat');
        result = svm(training.fitur_training_VisTex, testing.fitur_training_VisTex);
        hasil = classperf(result, testing.fitur_training_VisTex(:,1));
        disp(size(result));
        textLabel = sprintf('Akurasi = %f', hasil.correctrate*100);
        
        set(handles.text2, 'String', textLabel);
    elseif (size(handles.type,2) == size('rotated',2))
        training = load('fitur_glcm.mat');
        testing = load ('fitur_glcm_rotated.mat');
        result = svm(training.fitur_training_VisTex, testing.fitur_training_VisTex);
        hasil = classperf(result, testing.fitur_training_VisTex(:,1));
        
        disp(size(result));
        textLabel = sprintf('Akurasi = %f', hasil.correctrate*100);
        
        set(handles.text2, 'String', textLabel);
    elseif (size(handles.type,2) == size('scaled',2))
        training = load('fitur_glcm.mat');
        testing = load ('fitur_glcm_scaled.mat');
        result = svm(training.fitur_training_VisTex, testing.fitur_training_VisTex);
        hasil = classperf(result, testing.fitur_training_VisTex(:,1));
        disp(size(result));
        textLabel = sprintf('Akurasi = %f', hasil.correctrate*100);
        
        set(handles.text2, 'String', textLabel);
    end
end
