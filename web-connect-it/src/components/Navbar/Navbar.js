import React, { Component } from 'react';
import './Navbar.css'

export class Navbar extends Component {
    constructor(props) {
        super(props);
        this.props = props;
    }
    render() {
        return(
            <nav className="navbar">
                <ul className="navbar-nav">
                    { this.props.children }
                </ul>
            </nav>
        )
    }
}