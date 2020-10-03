import React, { Component } from 'react';
import './NavSearchbar.css'

export class NavSearchbar extends Component {
    constructor(props) {
        super(props);
        this.props = props;
    }
    render() {
        return(
            <ul className="navbar-search">
                <li className="search-item">
                    <a href="#" className="icon-button">

                    </a>
                </li>
                <li className="search-item">
                    <input type="text"/>
                </li>
            </ul>
        )
    }
}