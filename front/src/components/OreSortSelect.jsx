import React from 'react';
import createClass from 'create-react-class';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import Select from 'react-select';


const selectList = [{value:"SELL_PRICE" , label:"Sell Price" , icon:"fa fa-money" },
                      {value:"MINERALS" , label:"Minerals" , icon:"fa fa-recycle" },
                      {value:"SECURITY_LEVEL" , label:"Security" , icon:"fa fa-shield" } ];

const SortValue = createClass({
    propTypes: {
        children: PropTypes.node,
        placeholder: PropTypes.string,
        value: PropTypes.object,
        disabled: PropTypes.bool.isRequired,
    },

    render () {
        
        return (
            <div className="Select-value" title={this.props.value.label}>
                <span className="Select-value-label">
                    <i className={this.props.value.icon}></i>
                     <span> {this.props.value.label}</span>
                </span>
            </div>
        );
    }
});

const SortOption = createClass({
    propTypes:{
        children: PropTypes.node,
        className: PropTypes.string,
        isDisabled: PropTypes.bool,
        isFocused: PropTypes.bool,
        isSelected: PropTypes.bool,
        onFocus: PropTypes.func,
        onSelect: PropTypes.func,
        option: PropTypes.object.isRequired,
    },

    handleMouseDown (event) {
        event.preventDefault();
        event.stopPropagation();
        this.props.onSelect(this.props.option, event);
    },
    handleMouseEnter (event) {
        this.props.onFocus(this.props.option, event);
    },
    handleMouseMove (event) {
        if (this.props.isFocused) return;
        this.props.onFocus(this.props.option, event);
    },

    render(){
        return <div className={this.props.className}
            onMouseDown={this.handleMouseDown}
            onMouseEnter={this.handleMouseEnter}
            onMouseMove={this.handleMouseMove}
            title = {this.props.option.label} > 
            <i className={this.props.option.icon}></i>

            <span> {this.props.children}</span>
        </div>
    }

});

class OreSortSelect extends React.Component {
    propTypes:{
        onSelectChange: PropTypes.func
    }

    constructor(props) {
        super(props);
        this.handleSelectChanges = this.handleSelectChanges.bind(this);
    }
  
  handleSelectChanges(value){

      this.props.onSelectChange(value);
  }

  render() {

    return  <Select 
                name="ore-sort"
                autosize={true}
                options={selectList}
                optionComponent={SortOption}
                onChange={this.handleSelectChanges}
                valueComponent={SortValue}
                value = {this.props.value}
                placeholder = "Sort by"
                clearable = {false}
                simpleValue

                />
    		
  }
}



export default OreSortSelect;