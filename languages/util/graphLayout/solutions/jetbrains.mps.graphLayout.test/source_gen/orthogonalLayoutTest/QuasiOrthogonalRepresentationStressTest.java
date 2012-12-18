package orthogonalLayoutTest;

/*Generated by MPS */

import jetbrains.mps.graphLayout.graph.Graph;
import sampleGraphs.RandomGraphGenerator;
import jetbrains.mps.graphLayout.algorithms.BiconnectAugmentation;
import java.io.PrintWriter;
import visualization.GraphIO;
import jetbrains.mps.graphLayout.planarGraph.EmbeddedGraph;
import jetbrains.mps.graphLayout.planarization.ShortestPathEmbeddingFinder;
import jetbrains.mps.graphLayout.planarization.PQPlanarizationFinder;
import java.util.Map;
import jetbrains.mps.graphLayout.planarGraph.Dart;
import jetbrains.mps.internal.collections.runtime.MapSequence;
import java.util.HashMap;
import jetbrains.mps.graphLayout.flowOrthogonalLayout.QuasiOrthogonalRepresentation;
import jetbrains.mps.graphLayout.flowOrthogonalLayout.QuasiRepresentationModifier;

public class QuasiOrthogonalRepresentationStressTest {
  public QuasiOrthogonalRepresentationStressTest() {
  }

  public static void main(String[] args) throws Exception {
    String fileName = "C:\\work\\stressQuasi.txt";
    int numNodes = Integer.parseInt(args[0]);
    int numEdges = Integer.parseInt(args[1]);
    int numIter = Integer.parseInt(args[2]);
    for (int iter = 0; iter < numIter; iter++) {
      System.out.println("ITERATION: " + iter);
      Graph graph = RandomGraphGenerator.generateSimpleConnectedGraph(numNodes, numEdges);
      BiconnectAugmentation.smartMakeBiconnected(graph);
      PrintWriter out = new PrintWriter(fileName);
      GraphIO.writeGraph(graph, out);
      out.close();
      EmbeddedGraph embeddedGraph = new ShortestPathEmbeddingFinder(new PQPlanarizationFinder()).find(graph);
      Map<Dart, Integer> bends = MapSequence.fromMap(new HashMap<Dart, Integer>());
      Map<Dart, Integer> angles = MapSequence.fromMap(new HashMap<Dart, Integer>());
      QuasiOrthogonalRepresentation.getRepresentation(embeddedGraph, bends, angles);
      OrthogonalRepresentationChecker.checkOrthogonalRepresentation(graph, bends, angles, 0);
      new QuasiRepresentationModifier(embeddedGraph, bends, angles).reduceToOrthogonalRepresentation();
      OrthogonalRepresentationChecker.checkOrthogonalRepresentation(graph, bends, angles, 0);
    }
    System.out.println("END!");
  }
}
