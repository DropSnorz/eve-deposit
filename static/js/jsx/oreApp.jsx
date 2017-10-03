import React from 'react';
import ReactDOM from 'react-dom';
import OreFilter from './oreFilter.jsx';

class OreApp extends React.Component {
  render() {
    return 	<div>
    			<h1>Ore App</h1>
    			<div className="ore-filters">
    				<OreFilter/>
    			</div>
    		</div>
  }
}

ReactDOM.render(<OreApp/>, document.getElementById('ore-component'));