// ./src/App.jsx
import { useState, useEffect } from 'react';
import './App.css';
import Component1 from './components/Component1';
import { HashRouter as Router, Routes, Route } from 'react-router-dom';

function App() {
    return (
        <div>
            <Component1 />
        </div>
    );
}

export default App;
