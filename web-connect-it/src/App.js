import React from 'react';
import { Navbar } from './components/Navbar/Navbar'
import { NavItem } from './components/Navbar/NavItem'
import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <Navbar>
          <NavItem icon="😀"/>
          <NavItem icon="😀"/>
          <NavItem icon="😀"/>
      </Navbar>
    </div>
  );
}

export default App;
