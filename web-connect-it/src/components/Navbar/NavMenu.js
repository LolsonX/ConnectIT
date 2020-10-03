import React, { Component } from 'react';
import './NavMenu.css'

export class NavMenu extends Component {
    constructor(props) {
        super(props);
        this.props = props;
    }
    render() {
        return(
            <ul className="nav-menu">
            </ul>
        )
    }
}