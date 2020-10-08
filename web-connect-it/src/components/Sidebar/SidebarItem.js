import React, {Component} from "react";
import './SidebarItem.css'

export class SidebarItem extends Component{
    constructor(props) {
        super(props);
        this.props = props;
    }
    render(){
        return <li className="sidebar-nav-item">
            <a href="#" className="sidebar-nav-link">
                {this.props.children}
                <span className="link-text">{this.props.text}</span>

            </a>
        </li>
    }

}