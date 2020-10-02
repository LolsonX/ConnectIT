import React, { Component } from 'react';
import './NavItem.css'

export class NavItem extends Component {
    constructor(props) {
        super(props)
        this.props = props
    }

    render() {
        return (
            <li className="nav-item">
                <a href="#" className="icon-button">
                    {this.props.icon}
                </a>
            </li>
        )
    }
}