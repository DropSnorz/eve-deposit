import React from 'react';
import createClass from 'create-react-class';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import Select from 'react-select';

const OreValue = createClass({
    propTypes: {
        children: PropTypes.node,
        placeholder: PropTypes.string,
        value: PropTypes.object,
        onRemove: PropTypes.func.isRequired,
        disabled: PropTypes.bool.isRequired,
    },

    handleRemove(){

        if(!this.props.disabled) {
            this.props.onRemove(this.props.value)             
        }
    },

    render () {
        
        return (
            <div className="Select-value" title={this.props.value.name}>
                <span className="Select-value-label">
                    <i onMouseDown={this.handleRemove} className="fa fa-times" aria-hidden="true"></i> {" | "}
                    <img src={"/media/ore/icons/" + this.props.value.graphicId} className="select-icon" />
                    {this.props.children}
                </span>
            </div>
        );
    }
});

const OreOption = createClass({
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
            title = {this.props.option.name} >
            <img src={"/media/ore/icons/" + this.props.option.graphicId + ".png"} className="select-icon" alt="" />
            {this.props.children}
        </div>
    }

});

class OreNameSelect extends React.Component {
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

    var oreList = this.props.oreList.map(function (item) {
            return (
                {value: item.name, label: item.name, graphicId: item.graphicId}
            );
    }, this);

    return  <Select 
                name="ore-search"
                multi
                autosize={true}
                options={oreList}
                optionComponent={OreOption}
                onChange={this.handleSelectChanges}
                valueComponent={OreValue}
                value = {this.props.value}
                placeholder="Select ORE"
                simpleValue
                />
    		
  }
}



export default OreNameSelect;