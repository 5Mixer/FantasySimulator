<template>
	<div>
		<h3>New item</h3>
		<div>
			Name: <input type="text" placeholder="name" v-model="name"></input>
		</div>
		<div>
			Tags: <input type="text" placeholder="tags" v-model="tags"></input>
		</div>
		<div>
			<button @click="addItem">Add item</button>
		</div>
	</div>
</template>

<script>
export default {
	name: 'NewItemForm',
	data: () => {
		return {
			name: "",
			tags: ""
		}
	},
	methods: {
		"addItem": function (event) {
			var data = {name: this.name, tags: this.tags.split(" ")}

			fetch('http://localhost:3000/items', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json',
				},
				body: JSON.stringify(data),
			})
			.then((response) => response.json())
			.then((data) => {
				console.log('Success:', data);
			})

			this.name = ""
			this.tags = ""
		}
	}
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
	margin: 40px 0 0;
}
ul {
	list-style-type: none;
	padding: 0;
}
li {
	display: inline-block;
	margin: 0 10px;
}
a {
	color: #42b983;
}
</style>
