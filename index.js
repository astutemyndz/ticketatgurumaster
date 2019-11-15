import React from 'react'
import ReactDOM from 'react-dom';
import AppContainer from './src/containers/App/AppContainer';
import store from './src/store';

import {Provider} from 'react-redux';
ReactDOM.render(
    
        <AppContainer/>
    
    , document.getElementById('root'));