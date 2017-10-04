import React from 'react';
import ReactDOM from 'react-dom';

class OreFilter extends React.Component {
  render() {
    var minerals = this.props.mineralList.map(function (item) {
            return (
                <MineralFilter
                    name={item.name} />
            );
    }, this);

    return  <div>
    			<div className="text-center">
    				<a className="btn btn-primary">High Sec</a>
    				<a className="btn btn-danger">Low Sec</a>
    				<a className="btn btn-default">All</a>
    			</div>
		    	<form>

		    		<input type="text" placeholder="Ore name..." />
                    <select>
                        <option> Sell Profits </option>
                        <option> Refinery Profits </option>
                    </select>

		    	</form>
                <div>
                    {minerals}
                </div>
    		</div>
    		
  }
}


class MineralFilter extends React.Component{

    constructor(props) {
        super(props);
        this.state = {selected: false};
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e){
            this.setState(prevState => ({
                selected: !prevState.selected
        }));
    }

    render(){
        var name = this.props.name;
        var notSelected = "";
        if(!this.state.selected){
            notSelected = "badge-transparent";
        }
        return <span className="mr-2">
                <span className={"badge badge-primary " + notSelected } onClick={this.handleClick}> {name} </span>
                </span>
    }


}


export default OreFilter;