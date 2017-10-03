import React from 'react';
import ReactDOM from 'react-dom';

class OreFilter extends React.Component {
  render() {
    return  <div>
    			<div className="text-center">
    				<a className="btn btn-primary">High Sec</a>
    				<a className="btn btn-danger">Low Sec</a>
    				<a className="btn btn-default">All</a>
    			</div>
		    	<form>

		    		<input type="text" />

		    	</form>
    		</div>
    		
  }
}

export default OreFilter;