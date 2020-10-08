import React, { Component } from 'react';
import {NavSearchbar} from './NavSearchbar'
import {NavMenu} from './NavMenu'
import './Navbar.css'
import {NavMenuItem} from "./NavMenuItem";

export class Navbar extends Component {
    constructor(props) {
        super(props);
        this.props = props;
    }
    render() {
        return(
            <nav className="navbar">
                <div className="left-nav-container">
                    <NavSearchbar />
                </div>
                <div className="center-nav-container">
                    <NavMenu>
                        <NavMenuItem icon="😀"/>
                    </NavMenu>
                </div>
                <div className="right-nav-container">
                    <ul className="navbar-nav">
                        { this.props.children }
                    </ul>
                </div>
            </nav>
        )
    }
}