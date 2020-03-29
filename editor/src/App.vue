<template>
	<div id="app">
		<h1>Fantasy Simulator Database</h1>

		<div>
			<h2>Item Types</h2>
			<div>
				<NewItemForm />
			</div>
			<hr>
			

			<div>
				<div v-for="item in items">
					<h2>{{item.name}}</h2>
					<h3>Tags</h3>
					<input type="" placeholder="tags" v-model="item.tags">
					<!-- {{item.attributes}} -->
					<div v-for="(attributeData, attribute) in item.attributes" class='attribute'>
						{{attribute}}:{{attributeData}}
						<!--<div v-for="(value, key) in item.attributes">
							<h3>{{key}}</h3>
							<div v-for="(value, key) in value" class='attribute'>
								<h3>
									{{key}}
								</h3>
								<div v-if="typeof value!='object'">
									{{value}}
								</div>
								<div v-if="value==null">
									null
								</div>

								<div v-if="typeof value==='object'" class='attribute'>
									<div v-for="(value, key) in value">
										<h3>{{key}}</h3>
										:
										{{value}}
									</div>
								</div>
							</div>
						</div> -->

					</div>
					
					<hr>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import NewItemForm from './components/NewItemForm.vue'

export default {
	name: 'App',
	components: {
		NewItemForm
	},
	data: () => { 
		return {
			items: [
				{
					name: 'Bread',
					tags: ['edible', 'consumable'],
					attributes: {
						food: {
							hungerRestoration: 10
						},
						weight: 0.3
					}
				},
				{
					name: 'Dagger',
					tags: ['weapon'],
					attributes: {
						weapon: {
							damage: 10,
							poison: undefined
						}
					},
					weight: 0.3
				},
				{
					name: 'Poison Dagger',
					tags: ['weapon', 'rare'],
					attributes: {
						weapon: {
							damage: 10,
							poison: {
								duration: 10,
								damage: 5
							}
						},
						weight: 0.3
					}
				},
				{
					name: 'Gold coin',
					tags: ['currency'],
					attributes: {
						currency: {
							equivalentValue: 1
						},
						weight: 0.01
					}
				}
			]
		}
	}
}
</script>

<style>
#app {
	font-family: monospace;
	font-size: 18px;
	/* font-family: Avenir, Helvetica, Arial, sans-serif; */
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	margin: 60px;
}
.attribute {
	margin-left: 1em;
	/* background-color: rgba(0,0,0, 0.1); */
	border-left: .5em solid grey;
	padding-left: .5em;
	padding: .1em;
}
</style>
